if Config.UseOldSlingScript then
    Config2 = {}
    Config2.CoreName = "qb-core" -- Only change this if you have changed your core name.
    Config2.Inventory = "qb-inventory" -- Inventory type (ox_inventory, qb-inventory, lj-inventory etc.)

    Config2.LoopSpeed = 500 -- How fast the loop to check weapons runs. Lower numbers are lest optimized.

    Config2.Placement = {
        ["Back"] = {
            bone = 24816,
            x = 0.275, -- up and down
            y = -0.165, -- in and out
            z = 0.02, -- left and right
            x_rotation = 0.0,
            y_rotation = 0.0,
            z_rotation = 0.0
        },
        ["Front"] = {
            bone = 10706,
            x = 0.0, -- up and down
            y = 0.19, -- in and out
            z = -0.25, -- left and right
            x_rotation = 0.0, -- flips the gun how you would want
            y_rotation = 75.0, -- tilts sideways
            z_rotation = 180.0 -- tilts into ped
        }
    }
    Config2.PlacementSecond = {
        ["Back"] = {
            bone = 24816,
            x = 0.235, -- up and down
            y = -0.165, -- in and out
            z = -0.08, -- left and right
            x_rotation = 180.0, -- flips the gun how you would want
            y_rotation = 0.0, -- tilts sideways
            z_rotation = 0.0 -- tilts into ped
        },
        ["Front"] = {
            bone = 24816,
            x = 0.275, -- up and down
            y = -0.165, -- in and out
            z = 0.02, -- left and right
            x_rotation = 0.0, -- flips the gun how you would want
            y_rotation = 0.0, -- tilts sideways
            z_rotation = 0.0 -- tilts into ped
        }
    }
    Config2.PlacementThird = {
        ["Back"] = {
            bone = 10706,
            x = 0.0, -- up and down
            y = 0.19, -- in and out
            z = -0.25, -- left and right
            x_rotation = 0.0, -- flips the gun how you would want
            y_rotation = 75.0, -- tilts sideways
            z_rotation = 180.0 -- tilts into ped
        },
        ["Front"] = {
            bone = 24816,
            x = 0.235, -- up and down
            y = -0.165, -- in and out
            z = -0.08, -- left and right
            x_rotation = 180.0, -- flips the gun how you would want
            y_rotation = 0.0, -- tilts sideways
            z_rotation = 0.0 -- tilts into ped
        }
    }

    -- To add custom rotations to items or weapons all you need to do is add the "x_rotation = 0.0, y_rotation = 90.0, z_rotation = 0.0" 
    -- as seen for the "weapon_machete" for example and adjust the values of the rotations.
    Config2.WeaponsOnBack = {
        -- assault rifles:
        ["weapon_carbinerifle"] = { model = "w_ar_carbinerifle" },
        ["weapon_compactrifle"] = { model = "w_ar_assaultrifle_smg" },
        ["weapon_carbinerifle_mk2"] = { model = "w_ar_carbineriflemk2" },
        ["weapon_assaultrifle"] = { model = "w_ar_assaultrifle" },
        ["weapon_specialcarbine"] = { model = "w_ar_specialcarbine" },
        ["weapon_bullpuprifle"] = { model = "w_ar_bullpuprifle" },
        ["weapon_advancedrifle"] = { model = "w_ar_advancedrifle" },
        -- sub machine guns:
        ["weapon_microsmg"] = { model = "w_sb_microsmg" },
        ["weapon_assaultsmg"] = { model = "w_sb_assaultsmg" },
        ["weapon_smg"] = { model = "w_sb_smg" },
        ["weapon_smg_mk2"] = { model = "w_sb_smgmk2" },
        ["weapon_gusenberg"] = { model = "w_sb_gusenberg" },
        -- sniper rifles:
        ["weapon_sniperrifle"] = { model = "w_sr_sniperrifle" },
        -- shotguns:
        ["weapon_sawnoffshotgun"] = { model = "w_sg_sawnoff" },
        ["weapon_assaultshotgun"] = { model = "w_sg_assaultshotgun" },
        ["weapon_bullpupshotgun"] = { model = "w_sg_bullpupshotgun" },
        ["weapon_pumpshotgun"] = { model = "w_sg_pumpshotgun" },
        ["weapon_musket"] = { model = "w_ar_musket" },
        ["weapon_heavyshotgun"] = { model = "w_sg_heavyshotgun" },
        -- mele weapons
        ["weapon_machete"] = { model = "w_me_machette_lr", x_rotation = 0.0, y_rotation = 90.0, z_rotation = 0.0 },
        ["weapon_bat"] = { model = "w_me_bat", x_rotation = 0.0, y_rotation = 90.0, z_rotation = 0.0 },
        ["coke_brick"] = { model = "bkr_prop_coke_cutblock_01", x_rotation = 0.0, y_rotation = 90.0, z_rotation = 90.0 },
        ["markedbills"] = { model = "prop_money_bag_01", x_rotation = 0.0, y_rotation = 90.0, z_rotation = 0.0 },

        -- Addon weapons
        ["weapon_katana"] = { model = "w_me_katana", x_rotation = 0.0, y_rotation = 90.0, z_rotation = 0.0 },
        ["weapon_remington"] = { model = "w_sg_remington" },
        ["weapon_mp5"] = { model = "w_sb_mp5" },
        ["weapon_huntingrifle"] = { model = "w_sr_huntingrifle" },
    }
end