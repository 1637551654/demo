-- 命令
--- -gg 投降
Game().command("^-gg$", function()
    evtData.triggerPlayer.quit("GG")
end)
--- -apm 查看玩家分钟操作数
Game().command("^-apm$", function(evtData)
    echo("您的apm为:" .. evtData.triggerPlayer.apm(), evtData.triggerPlayer)
end)
--- -d [+|-|=][NUMBER]减少/增加/设置视距
Game().command("^-d [-+=]%d+$", function(evtData)
    local cds = string.explode(" ", string.lower(evtData.chatString))
    --echo("cds[2]的值为" .. cds[2]) 结果为+200
    local first = string.sub(cds[2], 1, 1)
    if (first == "+" or first == "-" or first == "=") then
        --视距
        local v = string.sub(cds[2], 2, string.len(cds[2]))
        v = math.abs(tonumber(v))
        if (v > 0) then
            local val = math.abs(v)
            async.call(evtData.triggerPlayer, function()
                if (first == "+") then
                    Camera().distance("+=" .. val)
                elseif (first == "-") then
                    Camera().distance("-=" .. val)
                elseif (first == "=") then
                    Camera().distance(val)
                end
                echo("视距已设置为：" .. Camera().distance(), evtData.triggerPlayer)
            end)
        end
    end
end)
--昼夜调节 以输入-daytime 12.5为例，cutStr = 5 strTime = 12.86666666... 魔兽里小数点后两位还要x0.6所以要÷回来
Game().command("^-daytime %d+%.*%d*$", function(evtData)
    local enterString = string.explode(" ", evtData.chatString)
    local cutStr = string.sub(enterString[2], 4, 5)
    -- echo("cutStr =" .. cutStr)
    local cutNumber = tonumber(cutStr)
    local strTime = tonumber(string.sub(enterString[2], 1, 3) .. string.sub(tostring(cutNumber / 0.6 * 10), 1, 2))
    -- echo("匹配的" .. strTime)
    time.timeOfDay(strTime)
    if (strTime >= 0.00 and strTime < 6.00) then
        echo("已调节为" .. "凌晨")
    elseif (strTime >= 6.00 and strTime < 8.00) then
        echo("已调节为" .. "清晨")
    elseif (strTime >= 8.00 and strTime < 12.00) then
        echo("已调节为" .. "上午")
    elseif (strTime >= 12.00 and strTime < 13.00) then
        echo("已调节为" .. "中午")
    elseif (strTime >= 13.00 and strTime < 18.00) then
        echo("已调节为" .. "下午")
    elseif (strTime >= 18.00 and strTime < 22.00) then
        echo("已调节为" .. "夜晚")
    else
        echo("已调节为" .. "深夜")
    end
end)
if (DEBUGGING) then
    --- 流程掌控
    Game().command("^-proc [a-zA-Z0-9_]+$", function(evtData)
        local p = string.trim(evtData.matchedString)
        p = string.sub(p, 7, string.len(p))
        local proc
        if (p == "this") then
            proc = ProcessCurrent
        else
            proc = Processes.get(p)
        end
        if (isProcess(proc)) then
            print(p .. "流程已重置")
            proc.start()
        end
    end)
end
