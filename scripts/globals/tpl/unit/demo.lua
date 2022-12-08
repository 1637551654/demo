--- 单位例子
TPL_UNIT.Footman = UnitTpl("Footman")
    -- .abilitySlot({ TPL_ABILITY.DEMO, TPL_ABILITY.ZZJY })
    -- .abilitySlot({ TPL_ABILITY.DEMO })
    --.itemSlot({ TPL_ITEM.DEMO })
    .move(10000)
    .hp(100)
    .attack(20)
    .attackRange(500)
    .attackSpeed(400)
    .reborn(1,
    --.onEvent(EVENT.Unit.MoveTurn, "myTurn",
    function()
        print("I am turning!")
    end)

TPL_UNIT.HeroFlameLord = UnitTpl("HeroFlameLord")
    .abilitySlot({ TPL_ABILITY.DEMO })
    .itemSlot({ TPL_ITEM.DEMO })
    --.period(1000).primary("agi")
    .move(10000)
    .hp(10000)
    .attack(1)
    .attackRange(500)
    .attackSpeed(400)
    .reborn(0.5)
    .onEvent(EVENT.Unit.MoveTurn, "myTurn")
    --.attackRipple(30) -- 攻击波动
    .attackSpaceBase(0.2) -- 攻击基础频率 最小0.1
    .missilePush(Missile("DragonHawkMissile").homing(true)) -- 投射物
    .sight(1800)
    .sightDiff(1000)