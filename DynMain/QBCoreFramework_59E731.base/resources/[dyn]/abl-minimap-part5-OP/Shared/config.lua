Config = Config or {}
------------------------------------------------------------------------------------------------
-- ## Your Main Dependencies / Framework / Notify .
------------------------------------------------------------------------------------------------
Config.Core = {
    -- core = 'qb',                --  your framework = 'qb' / 'esx' -- next updates , ( if its possible )
    --   notify = 'qb',              -- qb / esx -- next updates , ( if its possible )
    -- corename = 'abl-framework', -- you framework folder name example 'abl-framework' or 'es_extended'  -- next updates , ( if its possible )
}
------------------------------------------------------------------------------------------------
-- ## It's your choice how to make things work.
------------------------------------------------------------------------------------------------
Config.Options = {
    -- keybindSound = 200, -- next updates , ( if its possible )
    -- DebugOn = 'yes', -- if you want some prints set to 'yes' -- next updates , ( if its possible )
    -- UseSound = 'yes', -- if you want a sound effect when the pause menu is open set to 'yes' -- next updates , ( if its possible )
    -- useitem = 'yes',    -- ( 'yes' / 'no') -- next updates , ( if its possible )
    -- usecommand = 'yes', -- ( 'yes' / 'no') -- next updates , ( if its possible )
    opacity = 90, -- change background opacity
    ------------------------------------------------------------------------------------------------
    RedGreenBlueAlpha = {
        LINE = { -- Line over the Options Color / https://rgbacolorpicker.com/
            ["RED"] = 0,
            ["GREEN"] = 178,
            ["BLUE"] = 255,
            ["ALPHA"] = 0.8,
        },
        STYLE = { -- Pause Menu Options Color / https://rgbacolorpicker.com/
            ["RED"] = 0,
            ["GREEN"] = 71,
            ["BLUE"] = 101,
            ["ALPHA"] = 0.8,
        },
        WAYPOINT = { -- Waypoint Color / https://rgbacolorpicker.com/
            ["RED"] = 0,
            ["GREEN"] = 178,
            ["BLUE"] = 255,
            ["ALPHA"] = 0.8,
        },
    },
    ------------------------------------------------------------------------------------------------
    Header = {
        ["TITLE"] = "Dynamic Roleplay",
        ["SUBTITLE"] = "discord.gg/dynamicrp",
        ["MAP"] = "Map",
        ["GAME"] = "Exit Game",
        ["LEAVE"] = "Return to Server List",
        ["QUIT"] = "Return to Desktop",
        ["INFO"] = "Information",
        ["STATS"] = "Statistics",
        ["SETTINGS"] = "Settings",
        ["GALLERY"] = "Gallery",
        ["KEYBIND"] = "Main Keybinds",
        ["EDITOR"] = "Rockstar Editor",
        ["SERVER_NAME"] = "Dynamic Roleplay",
        ["SERVER_TEXT"] = "Welcome to our city",
        ["SERVER_DISCORD"] = "discord.gg/dynamicrp"
    }
    ------------------------------------------------------------------------------------------------
}
------------------------------------------------------------------------------------------------
-- Config.UseName = {
--     --   CommandName = 'minimapstyle',-- next updates , ( if its possible )
--     -- itemName = 'tablet'-- next updates , ( if its possible )
-- }
-- ------------------------------------------------------------------------------------------------
-- Config.ImagesLinks = { -- next updates , ( if its possible )
--     defaultstyle =
--     'https://cdn.discordapp.com/attachments/1230552934480089211/1230588176884695080/minimap_1_0.png?ex=6633dd8c&is=6621688c&hm=9872c23f83319026af52ffbddbfd8e191d003ed1128bd01fef17e76e52a79d7f&',
--     policestyle =
--     'https://cdn.discordapp.com/attachments/1230552934480089211/1230603557405855825/minimap_1_0.png?ex=6633ebdf&is=662176df&hm=a3a72c386dc181322ec5c61b3c216a51fa9b7545c9247cacda0bb073a8301680&'
-- }
