local process = Process("StartDialog")

process.onStart(function(this)

    -- 开局选择对话框
    StartDialogTable = {}
    Dialog(
        "选择难度",
        {
            { hotkey = "Q", label = "天堂", value = 1 },
            { hotkey = "W", label = "简单", value = 2 },
            { hotkey = "E", label = "困难", value = 3 },
            { hotkey = "R", label = "地狱", value = 4 },
        },
        function(evtData)
            StartDialogTable[1] = evtData.hotkey
            -- 对话框不再使用则清理
            evtData.triggerDialog.destroy()

            if (evtData.hotkey == 1) then
                -- 难度1
            elseif (evtData.hotkey == 2) then
                -- 难度2
            elseif (evtData.hotkey == 3) then
                -- 难度3
            else
                -- 难度4
            end
            echo("选择了：" .. evtData.label .. "等级：" .. evtData.value)
        end).show(Player(1))

    process.onOver(function(this)
        print("触发onOver")
    end)

    -- 进入测试
    this.next("test")

end)
