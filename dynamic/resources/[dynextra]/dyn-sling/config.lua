Config = {}
Config.UseOldSlingScript = false -- MAKKE THIS TRUE IF YOU WANT TO USE THE OLD VERSION OF THE SCRIPT. VIDEO FOUND HERE: https://youtu.be/Pf-B03cmFtQ
if not Config.UseOldSlingScript then
    ---------- [Framework] ----------
    -- (DONT TOUCH THIS UNLESS YOU HAVE A CUSTOM FRAMEWORK)
    if GetResourceState('es_extended') == 'started' then
        Framework = "ESX" -- (ESX) or (DynCore)
    elseif GetResourceState('dyn-core') == 'started' then
        Framework = "DynCore" -- (ESX) or (DynCore)
    end
    if Framework == "DynCore" then
        Config.CoreName = "dyn-core" -- your core name
        FWork = exports[Config.CoreName]:GetCoreObject()
    elseif Framework == "ESX" then
        Config.CoreName = "es_extended" -- your core name
        FWork = exports[Config.CoreName]:getSharedObject()
    end
    ------------------------------
    ---------- [INTAGERS] ----------
    Config.LoopSpeed = 500 -- How fast the loop to check weapons runs. Lower numbers are lest optimized.
    Config.RackMaxWeight = 45000 -- Rack stash weight capacity.
    Config.RackSlots = 2 -- Rack stash amount of item slots available.
    ------------------------------
    ---------- [STRINGS] ----------
    Config.WeaponRackCommand = "rack" -- /rack command to rack weapons into any service vehicles
    Config.WeaponSettingCommand = "setweapon" -- /setweapon command to begin editing where the weapons/items should sit on the player
    Config.PersonalWeponSettingsCommand = "weaponposition"
    ------------------------------
    ---------- [TABLES] ----------
    Config.RackCapableJobs = { -- Jobs that can do the /rack command
        "leo",
        "police",
        "sheriff",
    }
    ------------------------------
    -- THE ATTACHMENTS WORK BUT SOME SERVERS HAD CRASHING ISSUES WHEN THEY WERE UNHASHED. YOU CAN UNHASH THEM BUT IF YOU CRASH THEN HASH THEM BACK OUT.
    Config.WeaponsOnBack = {-- THE ATTACHMENTS WORK BUT SOME SERVERS HAD CRASHING ISSUES WHEN THEY WERE UNHASHED. YOU CAN UNHASH THEM BUT IF YOU CRASH THEN HASH THEM BACK OUT.
        -- Pistols 
        ["weapon_pistol"] = { model = "w_pi_pistol" },

        -- Assault Rifles
        ["weapon_carbinerifle"] = {  -- THE ATTACHMENTS WORK BUT SOME SERVERS HAD CRASHING ISSUES WHEN THEY WERE UNHASHED. YOU CAN UNHASH THEM BUT IF YOU CRASH THEN HASH THEM BACK OUT.
            model = "w_ar_carbinerifle",           
            Attachments = { 
                 ["COMPONENT_CARBINERIFLE_CLIP_01"] = {Base = 'WAPClip',Component = "W_AR_CARBINERIFLE_MAG1"},
            --     ["COMPONENT_CARBINERIFLE_CLIP_02"] = {Base = 'WAPClip',Component = "W_AR_CARBINERIFLE_MAG2"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr',Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_SCOPE_MEDIUM"] = {Base = 'WAPScop',Component = "W_AT_SCOPE_MEDIUM"},
            --     ["COMPONENT_AT_AR_SUPP"] = {Base = 'WAPSupp', Component = "W_AT_AR_SUPP"},
            --     ["COMPONENT_AT_AR_AFGRIP"] = {Base = 'WAPGrip',Component = "W_AT_AR_AFGRIP"},
             }
        },
        ["weapon_compactrifle"] = { 
            model = "w_ar_assaultrifle_smg",
             Attachments = {
                 ["COMPONENT_COMPACTRIFLE_CLIP_01"] = {Base = 'WAPClip', Component = "w_ar_assaultrifle_smg_mag1"},
            --     ["COMPONENT_COMPACTRIFLE_CLIP_02"] = {Base = 'WAPClip', Component = "w_ar_assaultrifle_smg_mag2"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_SCOPE_MACRO"] = {Base = 'WAPScop', Component = "w_at_scope_macro"},
            --     ["COMPONENT_AT_AR_AFGRIP"] = {Base = 'WAPGrip', Component = "W_AT_AR_AFGRIP"},
             }
        },
        ["weapon_carbinerifle_mk2"] = { 
            model = "w_ar_carbineriflemk2",
             Attachments = {
                 ["COMPONENT_CARBINERIFLE_MK2_CLIP_01"] = {Base = 'WAPClip', Component = "w_ar_carbineriflemk2_mag1"},
            --     ["COMPONENT_CARBINERIFLE_MK2_CLIP_02"] = {Base = 'WAPClip', Component = "w_ar_carbineriflemk2_mag2"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_SIGHTS"] = {Base = 'WAPScop', Component = "w_at_sights_1"},
            --     ["COMPONENT_AT_AR_SUPP"] = {Base = 'WAPSupp', Component = "W_AT_AR_SUPP"},
            --     ["COMPONENT_AT_MUZZLE_01"] = {Base = 'WAPSupp', Component = "w_at_muzzle_1"},
            --     ["COMPONENT_AT_AR_AFGRIP_02"] = {Base = 'WAPGrip', Component = "w_at_afgrip_2"},
            --     ["COMPONENT_CARBINERIFLE_MK2_CAMO"] = {Base = 'Cosmetic', Component = "w_at_cr_camo1"},
             }
        },
        ["weapon_ak47"] = { 
            model = "w_ar_ak47",
             Attachments = {
                 ["COMPONENT_AK47_CLIP_01"] = {Base = 'WAPClip', Component = "w_ar_ak47_mag1"},
            --     ["COMPONENT_CARBINERIFLE_MK2_CLIP_02"] = {Base = 'WAPClip', Component = "w_ar_carbineriflemk2_mag2"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_SIGHTS"] = {Base = 'WAPScop', Component = "w_at_sights_1"},
            --     ["COMPONENT_AT_AR_SUPP"] = {Base = 'WAPSupp', Component = "W_AT_AR_SUPP"},
            --     ["COMPONENT_AT_MUZZLE_01"] = {Base = 'WAPSupp', Component = "w_at_muzzle_1"},
            --     ["COMPONENT_AT_AR_AFGRIP_02"] = {Base = 'WAPGrip', Component = "w_at_afgrip_2"},
            --     ["COMPONENT_CARBINERIFLE_MK2_CAMO"] = {Base = 'Cosmetic', Component = "w_at_cr_camo1"},
             }
        },
        ["weapon_ar15"] = { 
            model = "w_ar_ar15",
             Attachments = {
                 ["COMPONENT_AR15_CLIP_01"] = {Base = 'WAPClip', Component = "w_ar_ar15_mag1"},
            --     ["COMPONENT_CARBINERIFLE_MK2_CLIP_02"] = {Base = 'WAPClip', Component = "w_ar_carbineriflemk2_mag2"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_SIGHTS"] = {Base = 'WAPScop', Component = "w_at_sights_1"},
            --     ["COMPONENT_AT_AR_SUPP"] = {Base = 'WAPSupp', Component = "W_AT_AR_SUPP"},
            --     ["COMPONENT_AT_MUZZLE_01"] = {Base = 'WAPSupp', Component = "w_at_muzzle_1"},
            --     ["COMPONENT_AT_AR_AFGRIP_02"] = {Base = 'WAPGrip', Component = "w_at_afgrip_2"},
            --     ["COMPONENT_CARBINERIFLE_MK2_CAMO"] = {Base = 'Cosmetic', Component = "w_at_cr_camo1"},
             }
        },
        ["weapon_hk416"] = { 
            model = "w_ar_hk416",
             Attachments = {
                 ["COMPONENT_HK416_CLIP_01"] = {Base = 'WAPClip', Component = "w_ar_hk416_mag1"},
            --     ["COMPONENT_CARBINERIFLE_MK2_CLIP_02"] = {Base = 'WAPClip', Component = "w_ar_carbineriflemk2_mag2"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_SIGHTS"] = {Base = 'WAPScop', Component = "w_at_sights_1"},
            --     ["COMPONENT_AT_AR_SUPP"] = {Base = 'WAPSupp', Component = "W_AT_AR_SUPP"},
            --     ["COMPONENT_AT_MUZZLE_01"] = {Base = 'WAPSupp', Component = "w_at_muzzle_1"},
            --     ["COMPONENT_AT_AR_AFGRIP_02"] = {Base = 'WAPGrip', Component = "w_at_afgrip_2"},
            --     ["COMPONENT_CARBINERIFLE_MK2_CAMO"] = {Base = 'Cosmetic', Component = "w_at_cr_camo1"},
             }
        },
        ["weapon_assaultrifle"] = { 
            model = "w_ar_assaultrifle",
             Attachments = {
                 ["COMPONENT_ASSAULTRIFLE_CLIP_01"] = {Base = 'WAPClip', Component = "w_ar_assaultrifle_mag1"},
                 ["COMPONENT_ASSAULTRIFLE_CLIP_02"] = {Base = 'WAPClip', Component = "w_ar_assaultrifle_mag2"},
            --     ["COMPONENT_ASSAULTRIFLE_CLIP_03"] = {Base = 'WAPClip', Component = "w_ar_assaultrifle_boxmag"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_SCOPE_MACRO"] = {Base = 'WAPScop', Component = "w_at_scope_macro"},
            --     ["COMPONENT_AT_AR_SUPP_02"] = {Base = 'WAPSupp', Component = "w_at_ar_supp_02"},
            --     ["COMPONENT_AT_AR_AFGRIP"] = {Base = 'WAPGrip', Component = "W_AT_AR_AFGRIP"},
             }
        },
        ["weapon_specialcarbine"] = { 
            model = "w_ar_specialcarbine",
             Attachments = {
                 ["COMPONENT_SPECIALCARBINE_CLIP_01"] = {Base = 'WAPClip', Component = "w_ar_specialcarbine_mag1"},
            --     ["COMPONENT_SPECIALCARBINE_CLIP_02"] = {Base = 'WAPClip', Component = "w_ar_specialcarbine_mag2"},
            --     ["COMPONENT_SPECIALCARBINE_CLIP_03"] = {Base = 'WAPClip', Component = "w_ar_specialcarbine_boxmag"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_SCOPE_MEDIUM"] = {Base = 'WAPScop', Component = "w_at_scope_medium"},
            --     ["COMPONENT_AT_AR_SUPP_02"] = {Base = 'WAPSupp', Component = "w_at_ar_supp_02"},
            --     ["COMPONENT_AT_AR_AFGRIP"] = {Base = 'WAPGrip', Component = "W_AT_AR_AFGRIP"},
            --     ["COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER"] = {Base = 'Cosmetic', Component = "w_ar_specialcarbine_luxe"},
             }
        },
        ["weapon_bullpuprifle"] = { 
            model = "w_ar_bullpuprifle",
             Attachments = {
                 ["COMPONENT_BULLPUPRIFLE_CLIP_01"] = {Base = 'WAPClip', Component = "w_ar_bullpuprifle_mag1"},
            --     ["COMPONENT_BULLPUPRIFLE_CLIP_02"] = {Base = 'WAPClip', Component = "w_ar_bullpuprifle_mag2"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_SCOPE_SMALL"] = {Base = 'WAPScop', Component = "w_at_scope_small"},
            --     ["COMPONENT_AT_AR_SUPP"] = {Base = 'WAPSupp', Component = "w_at_ar_supp"},
            --     ["COMPONENT_AT_AR_AFGRIP"] = {Base = 'WAPGrip', Component = "W_AT_AR_AFGRIP"},
             }
        },
        ["weapon_microsmg2"] = { 
            model = "w_sb_uzi",
            -- Attachments = {
            --     ["COMPONENT_BULLPUPRIFLE_CLIP_01"] = {Base = 'WAPClip', Component = "w_ar_bullpuprifle_mag1"},
            --     ["COMPONENT_BULLPUPRIFLE_CLIP_02"] = {Base = 'WAPClip', Component = "w_ar_bullpuprifle_mag2"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_SCOPE_SMALL"] = {Base = 'WAPScop', Component = "w_at_scope_small"},
            --     ["COMPONENT_AT_AR_SUPP"] = {Base = 'WAPSupp', Component = "w_at_ar_supp"},
            --     ["COMPONENT_AT_AR_AFGRIP"] = {Base = 'WAPGrip', Component = "W_AT_AR_AFGRIP"},
            -- }
        },
        ["weapon_advancedrifle"] = {
            model = "w_ar_advancedrifle",           
             Attachments = {
                 ["COMPONENT_ADVANCEDRIFLE_CLIP_01"] = {Base = 'WAPClip', Component = "w_ar_advancedrifle_mag1"},
            --     ["COMPONENT_ADVANCEDRIFLE_CLIP_02"] = {Base = 'WAPClip', Component = "w_ar_advancedrifle_mag2"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_SCOPE_SMALL"] = {Base = 'WAPScop', Component = "w_at_scope_small"},
            --     ["COMPONENT_AT_AR_SUPP"] = {Base = 'WAPSupp', Component = "w_at_ar_supp"},
             }
        },

        -- Sub Machine Guns
        ["weapon_microsmg"] = {
            model = "w_sb_microsmg",
             Attachments = {
                 ["COMPONENT_MICROSMG_CLIP_01"] = {Base = 'WAPClip', Component = "w_sb_microsmg_mag1"},
            --     ["COMPONENT_MICROSMG_CLIP_02"] = {Base = 'WAPClip', Component = "w_sb_microsmg_mag2"},
            --     ["COMPONENT_AT_PI_FLSH"] = {Base = 'WAPFlshLasr', Component = "w_at_pi_flsh"},
            --     ["COMPONENT_AT_SCOPE_MACRO"] = {Base = 'WAPScop', Component = "w_at_scope_macro"},
            --     ["COMPONENT_AT_AR_SUPP_02"] = {Base = 'WAPSupp', Component = "w_at_ar_supp_02"},
             }
        },
        ["weapon_assaultsmg"] = {
            model = "w_sb_assaultsmg",
             Attachments = {
                 ["COMPONENT_ASSAULTSMG_CLIP_01"] = {Base = 'WAPClip', Component = "W_SB_ASSAULTSMG_Mag1"},
            --     ["COMPONENT_ASSAULTSMG_CLIP_02"] = {Base = 'WAPClip', Component = "W_SB_ASSAULTSMG_Mag2"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_SCOPE_MACRO"] = {Base = 'WAPScop', Component = "w_at_scope_macro"},
            --     ["COMPONENT_AT_AR_SUPP_02"] = {Base = 'WAPSupp', Component = "w_at_ar_supp_02"},
             }
        },
        ["weapon_smg"] = {
            model = "w_sb_smg",
             Attachments = {
                 ["COMPONENT_SMG_CLIP_01"] = {Base = 'WAPClip', Component = "w_sb_smg_mag1"},
            --     ["COMPONENT_SMG_CLIP_02"] = {Base = 'WAPClip', Component = "w_sb_smg_mag2"},
            --     ["COMPONENT_SMG_CLIP_03"] = {Base = 'WAPClip', Component = "w_sb_smg_boxmag"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_SCOPE_MACRO_02"] = {Base = 'WAPScop_2', Component = "w_at_scope_macro_2"},
            --     ["COMPONENT_AT_PI_SUPP"] = {Base = 'WAPSupp', Component = "w_at_pi_supp"},
             }
        },
        ["weapon_smg_mk2"] = {
            model = "w_sb_smgmk2",
             Attachments = {
                 ["COMPONENT_SMG_MK2_CLIP_01"] = {Base = 'WAPClip', Component = "w_sb_smgmk2_mag1"},
            --     ["COMPONENT_SMG_MK2_CLIP_02"] = {Base = 'WAPClip', Component = "w_sb_smgmk2_mag2"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_SIGHTS"] = {Base = 'WAPScop', Component = "w_at_sights_1"},
            --     ["COMPONENT_AT_SCOPE_SMALL"] = {Base = 'WAPScop', Component = "w_at_scope_small"},
            --     ["COMPONENT_AT_AR_AFGRIP_02"] = {Base = 'WAPGrip', Component = "w_at_afgrip_2"},
             }
        },
        ["weapon_gusenberg"] = {
            model = "w_sb_gusenberg",
             Attachments = {
                 ["COMPONENT_GUSENBERG_CLIP_01"] = {Base = 'WAPClip', Component = "w_sb_gusenberg_mag1"},
            --     ["COMPONENT_GUSENBERG_CLIP_02"] = {Base = 'WAPClip', Component = "w_sb_gusenberg_mag2"},
             }
        },

        -- Sniper Rifles
        ["weapon_musket"] = { model = "w_ar_musket" },
        ["weapon_sniperrifle"] = {
            model = "w_sr_sniperrifle",
             Attachments = {
                 ["COMPONENT_SNIPERRIFLE_CLIP_01"] = {Base = 'WAPClip', Component = "w_sr_sniperrifle_mag1"},
            --     ["COMPONENT_AT_SCOPE_LARGE"] = {Base = 'WAPScop', Component = "w_at_scope_large"},
            --     ["COMPONENT_AT_SCOPE_MAX"] = {Base = 'WAPScop', Component = "w_at_scope_max"},
            --     ["COMPONENT_AT_AR_SUPP_02"] = {Base = 'WAPSupp', Component = "w_at_ar_supp_02"},
            }
        },

        -- Shotguns
        ["weapon_sawnoffshotgun"] = { model = "w_sg_sawnoff" },
        ["weapon_assaultshotgun"] = {
            model = "w_sg_assaultshotgun",
             Attachments = {
                 ["COMPONENT_ASSAULTSHOTGUN_CLIP_01"] = {Base = 'WAPClip', Component = "w_sg_assaultshotgun_mag1"},
            --     ["COMPONENT_ASSAULTSHOTGUN_CLIP_02"] = {Base = 'WAPClip', Component = "w_sg_assaultshotgun_mag2"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_AR_SUPP"] = {Base = 'WAPSupp', Component = "w_at_ar_supp"},
            --     ["COMPONENT_AT_AR_AFGRIP"] = {Base = 'WAPGrip', Component = "w_at_ar_afgrip"},
             }
        },
        ["weapon_bullpupshotgun"] = {
            model = "w_sg_bullpupshotgun",
             Attachments = {
                 ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_AR_SUPP_02"] = {Base = 'WAPSupp', Component = "w_at_ar_supp_02"},
            --     ["COMPONENT_AT_AR_AFGRIP"] = {Base = 'WAPGrip', Component = "w_at_ar_afgrip"},
             }
        },
        ["weapon_pumpshotgun"] = {
            model = "w_sg_pumpshotgun",
            -- Attachments = {
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_SR_SUPP"] = {Base = 'WAPSupp', Component = "W_AT_AR_SUPP"},
            -- }
        },
        ["weapon_heavyshotgun"] = {
            model = "w_sg_heavyshotgun",
             Attachments = {
                 ["COMPONENT_HEAVYSHOTGUN_CLIP_01"] = {Base = 'WAPClip', Component = "w_sg_heavyshotgun_mag1"},
            --     ["COMPONENT_HEAVYSHOTGUN_CLIP_02"] = {Base = 'WAPClip', Component = "w_sg_heavyshotgun_mag2"},
            --     ["COMPONENT_HEAVYSHOTGUN_CLIP_03"] = {Base = 'WAPClip', Component = "w_sg_heavyshotgun_boxmag"},
            --     ["COMPONENT_AT_AR_FLSH"] = {Base = 'WAPFlshLasr', Component = "W_AT_AR_FLSH"},
            --     ["COMPONENT_AT_AR_SUPP_02"] = {Base = 'WAPSupp', Component = "w_at_ar_supp_02"},
            --     ["COMPONENT_AT_AR_AFGRIP"] = {Base = 'WAPGrip', Component = "w_at_ar_afgrip"},
             }
        },

        -- Melee Weapons
        ["weapon_machete"] = { model = "w_me_machette_lr" },
        ["weapon_bat"] = { model = "w_me_bat" },

        -- Items
        ["cokebaggy"] = { model = "bkr_prop_coke_cutblock_01" },
        ["markedbills"] = { model = "prop_money_bag_01" },
        ["meth"] = { model = "hei_prop_pill_bag_01" },
        ["weed_brick"] = { model = "bkr_prop_weed_drying_02a" },
        ["fishingrod"] = { model = "prop_fishing_rod_02" },
        ["fishingrod2"] = { model = "prop_fishing_rod_01" },
        ["fishingrod3"] = { model = "prop_fishing_rod_01" },

        -- Addon weapons
        -- ["weapon_katana"] = { model = "w_me_katana"},
        -- ["weapon_remington"] = { model = "w_sg_remington" },
        -- ["weapon_mp5"] = { model = "w_sb_mp5" },
        -- ["weapon_huntingrifle"] = { model = "w_sr_huntingrifle" },
    }
    ------------------------------
    ------------------------------
    --## DONT CHANGE ANY OF THESE ##--
    Config.FrameworkFunctions = {
        -- Client-side trigger callback
        TriggerCallback = function(...)
            if Framework == 'DynCore' then
                FWork.Functions.TriggerCallback(...)
            else
                FWork.TriggerServerCallback(...)
            end
        end,

        -- Server-side register callback
        CreateCallback = function(...)
            if Framework == 'DynCore' then
                FWork.Functions.CreateCallback(...)
            else
                FWork.RegisterServerCallback(...)
            end
        end,

        GetPlayer = function()
            local self = {}
            if Framework == 'DynCore' then
                player = FWork.Functions.GetPlayerData()
                self.PlayerData = { job = { name = player.job.name} }
                return self
            else
                player = FWork.GetPlayerData()
                self.PlayerData = {  job = { name = player.job.name }}
                return self
            end
            return nil
        end,
    }
    ------------------------------
    ------------------------------
end