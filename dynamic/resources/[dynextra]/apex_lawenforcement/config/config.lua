-- █████╗ ██████╗ ███████╗██╗  ██╗    ███████╗████████╗██╗   ██╗██████╗ ██╗ ██████╗ ███████╗
--██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝    ██╔════╝╚══██╔══╝██║   ██║██╔══██╗██║██╔═══██╗██╔════╝
--███████║██████╔╝█████╗   ╚███╔╝     ███████╗   ██║   ██║   ██║██║  ██║██║██║   ██║███████╗
--██╔══██║██╔═══╝ ██╔══╝   ██╔██╗     ╚════██║   ██║   ██║   ██║██║  ██║██║██║   ██║╚════██║
--██║  ██║██║     ███████╗██╔╝ ██╗    ███████║   ██║   ╚██████╔╝██████╔╝██║╚██████╔╝███████║
--╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝    ╚══════╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ ╚══════╝

----------------------------------------------------------------------------------------------------
   
-- ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗         ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
--██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██║         ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
--██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██║         ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
--██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║         ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
--╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║███████╗    ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
-- ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

Config = {}
Config.Debug = false


--     ██╗ ██████╗ ██████╗     ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
--     ██║██╔═══██╗██╔══██╗    ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
--     ██║██║   ██║██████╔╝    ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
--██   ██║██║   ██║██╔══██╗    ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
--╚█████╔╝╚██████╔╝██████╔╝    ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
-- ╚════╝  ╚═════╝ ╚═════╝     ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

Config.Name = "Law Enforcement"
Config.Jobname = {'police'} -- Add more jobs like this {'police', 'lspd', 'sheriff'}
Config.Blips = {
    StationBlips = {
        {
            enabled = true,
            point = vector3(438.83, -981.86, 30.69),
            sprite = 60,
            scale = 0.6,
            colour = 3,
            title = "Mission Row Police Depmartment",
        },
        -- {
        --     enabled = true,
        --     point = vector3(0.0, 0.0, 0.0),
        --     sprite = 60,
        --     scale = 0.6,
        --     colour = 3,
        --     title = "Police Depmartment",
        -- },
    },
    ColleagueBlips = { -- We suggest disabling this, if using a dispatch, that has blips included.
        enabled = true,
        sprite = 1,
        scale = 0.6,
        colour = 38,
    }
}
Config.Features = {
    BossMenu = true,
    RadialMenu = true,
    MDTAccess = true,
    PanicButton = true,
    TrafficControl = true,
    TrafficControlSettings = {
        ResumeCommand = 'resumetraffic',
        SlowdownCommand = 'slowtraffic',
        StopCommand = 'stoptraffic',
    },
    Duty = true,
    DutySettings = {
        DutyCommand = 'duty', -- This command simply toggles duty on and off
        StationRestriction = true, -- This will restrict the duty command to only work inside a radius of a police station
        RadiusFromStation = 50.0, -- This is the radius from the police station that the duty command will work (The radius is from "StationBlips")
    },
    CheckData = true, -- This is for checking: Fines, Bank Accounts & Licenses
    SearchPlayer = true,
    EverybodyCanSearch = false, -- If this is set to true, then the SearchPlayerCommand will be available to everyone
    SearchPlayerSettings = {
        SearchCommand = "search", -- You might have to disable this if you have a conflicting command from another script, such as an inventory
    },
    InteractionMenu = true,
    InteractionMenuSettings = {
        Key = 'F6',
        CallsignCommand = "callsign",
    },
    PlayerTarget = true,
    VehicleTarget = true,
    VehicleActions = true, -- This mean take out from vehicle and place in vehicle
    Impound = true,
    ImpoundSettings = {
        ImpoundCommand = "impound",
        ImpoundDuration = 20, -- This is in seconds
    },
    Depot = true,
    DepotSettings = {
        DepotCommand = "depot",
    },
    Objects = true,
    ObjectsSettings = {
        ObjectCommand = "pobject",
        SpawnDuration = 2, -- This is in seconds
        RemoveDuration = 2, -- This is in seconds
        ObjectTypes = {
            ["cone"] = {model = `prop_roadcone02a`, freeze = false},
            ["barrier"] = {model = `prop_barrier_work06a`, freeze = true},
            ["roadsign"] = {model = `prop_snow_sign_road_06g`, freeze = true},
            ["tent"] = {model = `prop_gazebo_03`, freeze = true},
            ["light"] = {model = `prop_worklight_03b`, freeze = true},
        }
    },
    Spikes = true,
    SpikesSettings = {
        SpikeStripCommand = "spike",
        MaxSpikes = 10,
    },
    GunRack = true,
    GunRackSettings = {
        GunrackItem = 'gunrack',
        InstallDuration = 5,
        RackSize = 500000,
        RackSlots = 5,
        Key = 'RCONTROL',
        AllowedVehicles = {
            'police',
            'police2',
            'police3',
        },
    },
    Wardrobe = true,
    WardrobeSettings = {
        ClothingStore = true,
        OutfitMenu = true,
        PersonalLocker = true,
    },
    EvidenceLocker = true,
    EvidenceLockerSettings = {
        Size = 4000000,
        Slots = 500,
    },
    Tracker = true,
    TrackerSettings = {
        PlaceTrackerCommand = "anklet",
        FindLocationCommand = "ankletlocation",
    },
    Handcuffing = true,
    HandcuffingSettings = {
        SoundEffect = true, -- Soundfiles can be found in asset folder
        SoftCuffingDefault = true,
        HandcuffItem = "handcuffs",
        CuffingCommand = "cuff",
        SoftcuffingCommand = "scuff",
    },
    BreakoutMinigame = true,
    BreakoutMinigameSettings = {-- You can NOT have CircleMinigame and SkillbarMinigame both true.
        CircleMinigame = true, -- This requires: 'dyn-ui': https://github.com/Project-Sloth/dyn-ui
        Time = 15,
        Circles = 1,
        ------------------------------------
        SkillbarMinigame = false, -- This requires: 'dyn-skillbar': https://github.com/DynCore-framework/dyn-skillbar
        Duration = math.random(7500, 15000), -- how long the skillbar runs for
        Pos = math.random(10, 30), -- how far to the right the static box is
        Width = math.random(10, 20), -- how wide the static box is
    },
    Escorting = true,
    EscortingSettings = {
        CanEverybodyEscort = false, -- If this is set to true, then the EscortingCommand will be available to everyone
        EscortingCommand = "escort",
    },
    HandleLicense = true,
    HandleLicenseSettings = {
        GrantLicenseCommand = "grantlicense",
        RevokeLicenseCommand = "revokelicense",
        RevokeDriverLicenseCommand = "revokedl",
        Licenses = {'driver', 'weapon', 'hunting'},
        RequiredJobRank = 2,
    },
    Tackle = true,
    TackleSettings = {
        PoliceLimitation = true,
        Key = 'G',
    },
    Robbing = true,
    RobbingSettings = {
        BlacklistedJobs = {'police', 'ambulance'},
    },
    Jailing = true,
    JailingSettings = {
        JailWithID = true, -- If false, then it will jail the closest player
        JailingCommand = "jail",
        UnjailingCommand = "unjail",
    },
    Billing = true,
    BillingSettings = {
        BillingCommand = "bill",
    },
    Armory = true,
    ArmorySettings = {
        label = "Police Armory",
        slots = 40, -- The amount of slots in the armory
        items = {
            [1] = {
                name = "weapon_combatpistol",
                price = 0,
                amount = 1,
                info = {
                    serie = "",                
                    attachments = {
                        {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 1,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [2] = {
                name = "weapon_stungun",
                price = 0,
                amount = 1,
                info = {
                    serie = "",            
                },
                type = "weapon",
                slot = 2,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [3] = {
                name = "weapon_pumpshotgun",
                price = 0,
                amount = 1,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 3,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [4] = {
                name = "weapon_smg",
                price = 0,
                amount = 1,
                info = {
                    serie = "",                
                    attachments = {
                        {component = "COMPONENT_AT_SCOPE_MACRO_02", label = "1x Scope"},
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 4,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [5] = {
                name = "weapon_carbinerifle",
                price = 0,
                amount = 1,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                        {component = "COMPONENT_AT_SCOPE_MEDIUM", label = "3x Scope"},
                    }
                },
                type = "weapon",
                slot = 5,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [6] = {
                name = "weapon_nightstick",
                price = 0,
                amount = 1,
                info = {},
                type = "weapon",
                slot = 6,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [7] = {
                name = "pistol_ammo",
                price = 0,
                amount = 10,
                info = {},
                type = "item",
                slot = 7,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [8] = {
                name = "shotgun_ammo",
                price = 0,
                amount = 10,
                info = {},
                type = "item",
                slot = 8,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [9] = {
                name = "smg_ammo",
                price = 0,
                amount = 10,
                info = {},
                type = "item",
                slot = 9,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [10] = {
                name = "rifle_ammo",
                price = 0,
                amount = 10,
                info = {},
                type = "item",
                slot = 10,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [11] = {
                name = "handcuffs",
                price = 0,
                amount = 1,
                info = {},
                type = "item",
                slot = 11,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [12] = {
                name = "weapon_flashlight",
                price = 0,
                amount = 1,
                info = {},
                type = "weapon",
                slot = 12,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [13] = {
                name = "empty_evidence_bag",
                price = 0,
                amount = 5,
                info = {},
                type = "item",
                slot = 13,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [14] = {
                name = "police_stormram",
                price = 0,
                amount = 5,
                info = {},
                type = "item",
                slot = 14,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [15] = {
                name = "armor",
                price = 0,
                amount = 5,
                info = {},
                type = "item",
                slot = 15,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [16] = {
                name = "radio",
                price = 0,
                amount = 5,
                info = {},
                type = "item",
                slot = 16,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [17] = {
                name = "heavyarmor",
                price = 0,
                amount = 5,
                info = {},
                type = "item",
                slot = 17,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            [18] = {
                name = "policegunrack",
                price = 0,
                amount = 1,
                info = {},
                type = "item",
                slot = 18,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            },
            -- [19] = {
            --     name = "itemname",
            --     price = 0,
            --     amount = 1,
            --     info = {},
            --     type = "item",
            --     slot = 19,
            --     authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7}
            -- },
        }
    },
    Garage = true,
    GarageSettings = {
        TeleportIntoVehicle = true,
        -- Missin Row (Gabz Garage)
        {
            spawner = vector4(446.00, -978.61, 25.706, 90.171),
            spawnpoint = vector4(445.012, -973.033, 25.706, 265.718),
            vehicles = {
                [1] = { vehiclename = 'Police 1', vehiclemodel = 'police', grade = 0 },
                [2] = { vehiclename = 'Police 2', vehiclemodel = 'police2', grade = 1 },
                -- [3] = { vehiclename = 'Title', vehiclemodel = 'model', grade = 0 },
            },
        },
        -- Misson Row Helipad
        {
            spawner = vector4(467.664, -1002.19, 45.209, 90.0),
            spawnpoint = vector4(476.422, -1003.297, 45.911, 270),
            vehicles = {
                [1] = { vehiclename = 'Police Helicopter', vehiclemodel = 'polmav', grade = 0 },
            },
        },
        -- To add more garages, copy the {} below and paste it in the list, make sure you add a comma to the station below it.
        -- {
        --     spawner = vector4(0.0, 0.0, 0.0, 0.0),
        --     spawnpoint = vector4(0.0, 0.0, 0.0, 0.0),
        --     vehicles = {
        --         [1] = { vehiclename = 'Title', vehiclemodel = 'model', grade = 0 },
        --     },
        -- },
    }
}


--████████╗ █████╗ ██████╗  ██████╗ ███████╗████████╗███████╗
--╚══██╔══╝██╔══██╗██╔══██╗██╔════╝ ██╔════╝╚══██╔══╝██╔════╝
--   ██║   ███████║██████╔╝██║  ███╗█████╗     ██║   ███████╗
--   ██║   ██╔══██║██╔══██╗██║   ██║██╔══╝     ██║   ╚════██║
--   ██║   ██║  ██║██║  ██║╚██████╔╝███████╗   ██║   ███████║
--   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝

Config.Targets = {
    -- To add more stations, copy the {} below and paste it in the list, make sure you add a comma to the station below it.
    -- Target below is based of Gabz MRPD (Adjust to whatever you want, if you are using something else).
    {
        Office = {
            {
                Coords = vector3(461.5, -986.47, 30.73),
                Heading = 0.0,
                Size = {1.2, 2.4},
                Distance = 2.0,
                minZ = 30.73-1.5,
                maxZ = 30.73+0.3,
            },
        },
        Duty = {
            {
                Coords = vector3(452.35, -999.94, 30.69),
                Heading = 0.0,
                Size = {1.2, 2.2},
                Distance = 2.0,
                minZ = 30.69-1.2,
                maxZ = 30.69+0.2,
            },
        },
        Wardrobe = {
            {
                Coords = vector3(461.98, -1000.16, 30.69),
                Heading = 0.0,
                Size = {0.4, 4.45},
                Distance = 2.0,
                minZ = 30.69-1.2,
                maxZ = 30.69+1.8,
            },
            {
                Coords = vector3(461.98, -995.43, 30.69),
                Heading = 0.0,
                Size = {0.4, 4.45},
                Distance = 2.0,
                minZ = 30.69-1.2,
                maxZ = 30.69+1.8,
            },
        },
        Armory = {
            {
                Coords = vector3(481.46, -994.85, 30.69),
                Heading = 0.0,
                Size = {0.4, 3.2},
                Distance = 2.0,
                minZ = 30.69-1.2,
                maxZ = 30.69+1.8,
            },
        },
        Evidence = {
            {
                Coords = vector3(475.83, -995.3, 26.27),
                Heading = 0.0,
                Size = {4.9, 0.85},
                Distance = 2.0,
                minZ = 26.27-1.2,
                maxZ = 26.27+1.8,
            },
            {
                Coords = vector3(473.87, -995.3, 26.27),
                Heading = 0.0,
                Size = {4.9, 0.85},
                Distance = 2.0,
                minZ = 26.27-1.2,
                maxZ = 26.27+1.8,
            },
            {
                Coords = vector3(471.91, -995.3, 26.27),
                Heading = 0.0,
                Size = {4.9, 0.85},
                Distance = 2.0,
                minZ = 26.27-1.2,
                maxZ = 26.27+1.8,
            },
        },
        FrontDesk = {
            {
                Coords = vector3(442.42, -979.61, 30.69),
                Heading = 0.0,
                Size = {0.2, 0.2},
                Distance = 2.0,
                minZ = 30.69+0.1,
                maxZ = 30.69+0.3,
            },
        },
    },
    -- The below is a template to show how to add more stations, copy the {} below
    -- and paste it in the list, make sure you add a comma to the station below it.
    -- {
    --     Office = {
    --         {
    --             Coords = vector3(0.0, 0.0, 0.0),
    --             Heading = 0.0,
    --             Size = {0.0, 0.0},
    --             Distance = 0.0,
    --             minZ = 0.0-0.0,
    --             maxZ = 0.0+0.0,
    --         },
    --     },
    --     Duty = {
    --         {
    --             Coords = vector3(0.0, 0.0, 0.0),
    --             Heading = 0.0,
    --             Size = {0.0, 0.0},
    --             Distance = 0.0,
    --             minZ = 0.0-0.0,
    --             maxZ = 0.0+0.0,
    --         },
    --     },
    --     Wardrobe = {
    --         {
    --             Coords = vector3(0.0, 0.0, 0.0),
    --             Heading = 0.0,
    --             Size = {0.0, 0.0},
    --             Distance = 0.0,
    --             minZ = 0.0-0.0,
    --             maxZ = 0.0+0.0,
    --         },
    --     },
    --     Armory = {
    --         {
    --             Coords = vector3(0.0, 0.0, 0.0),
    --             Heading = 0.0,
    --             Size = {0.0, 0.0},
    --             Distance = 0.0,
    --             minZ = 0.0-0.0,
    --             maxZ = 0.0+0.0,
    --         },
    --     },
    --     Evidence = {
    --         {
    --             Coords = vector3(0.0, 0.0, 0.0),
    --             Heading = 0.0,
    --             Size = {0.0, 0.0},
    --             Distance = 0.0,
    --             minZ = 0.0-0.0,
    --             maxZ = 0.0+0.0,
    --         },
    --     },
    --     FrontDesk = {
    --         {
    --             Coords = vector3(0.0, 0.0, 0.0),
    --             Heading = 0.0,
    --             Size = {0.0, 0.0},
    --             Distance = 0.0,
    --             minZ = 0.0-0.0,
    --             maxZ = 0.0+0.0,
    --         },
    --     },
    -- },
}


--███████╗███████╗ █████╗ ████████╗███████╗
--██╔════╝██╔════╝██╔══██╗╚══██╔══╝██╔════╝
--███████╗█████╗  ███████║   ██║   ███████╗
--╚════██║██╔══╝  ██╔══██║   ██║   ╚════██║
--███████║███████╗██║  ██║   ██║   ███████║
--╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝
                                           
Config.Seats = {
    --[[
        SEATS BELOW IS BASED OF GABZ MISSON ROW POLICE DEPARTMENT
        YOU CAN ADD, REMOVE OR ADJUST AS YOU WANT FOR MORE SEATS IN OTHER STATIONS
    ]]--
    --[[ MAIN FLOOR ]]--
    --[[ Lobby ]]--
    { coords = vector4(437.20, -978.09, 30.68, 180.0),  stand = vector3(437.20, -978.67, 29.69)},
    { coords = vector4(438.05, -978.09, 30.68, 180.0),  stand = vector3(438.05, -978.67, 29.69)},
    { coords = vector4(437.20, -985.73, 30.68, 0.0),    stand = vector3(437.20, -985.73, 29.69)},
    { coords = vector4(438.05, -985.73, 30.68, 0.0),    stand = vector3(438.05, -985.73, 29.69)},
    --[[ Press Room ]]--
    { coords = vector4(437.40, -998.07, 30.68, 90.0),   stand = vector3(436.95, -998.07, 29.69)},
    { coords = vector4(437.40, -997.41, 30.68, 90.0),   stand = vector3(436.95, -997.41, 29.69)},
    { coords = vector4(437.40, -996.68, 30.68, 90.0),   stand = vector3(436.95, -996.68, 29.69)},
    { coords = vector4(437.40, -993.46, 30.68, 90.0),   stand = vector3(436.95, -993.46, 29.69)},
    { coords = vector4(437.40, -992.79, 30.68, 90.0),   stand = vector3(436.95, -992.79, 29.69)},
    { coords = vector4(437.40, -992.07, 30.68, 90.0),   stand = vector3(436.95, -992.07, 29.69)},
    { coords = vector4(435.81, -998.07, 30.68, 90.0),   stand = vector3(435.32, -998.07, 29.69)},
    { coords = vector4(435.81, -997.41, 30.68, 90.0),   stand = vector3(435.32, -997.41, 29.69)},
    { coords = vector4(435.81, -996.68, 30.68, 90.0),   stand = vector3(435.32, -996.68, 29.69)},
    { coords = vector4(435.81, -993.46, 30.68, 90.0),   stand = vector3(435.32, -993.46, 29.69)},
    { coords = vector4(435.81, -992.79, 30.68, 90.0),   stand = vector3(435.32, -992.79, 29.69)},
    { coords = vector4(435.81, -992.07, 30.68, 90.0),   stand = vector3(435.32, -992.07, 29.69)},
    { coords = vector4(434.04, -997.41, 30.68, 90.0),   stand = vector3(433.58, -997.41, 29.69)},
    { coords = vector4(434.04, -996.68, 30.68, 90.0),   stand = vector3(433.58, -996.68, 29.69)},
    { coords = vector4(434.04, -993.46, 30.68, 90.0),   stand = vector3(433.58, -993.46, 29.69)},
    { coords = vector4(434.04, -992.79, 30.68, 90.0),   stand = vector3(433.58, -992.79, 29.69)},
    --[[ Archives ]]--
    { coords = vector4(452.45, -999.13, 30.68, 138.56), stand = vector3(451.8, -998.84, 29.69)},
    --[[ Lockers ]]--
    { coords = vector4(460.06, -997.32, 30.68, 0.0),    stand = vector3(460.06, -996.9, 29.69)},
    { coords = vector4(461.46, -997.32, 30.68, 0.0),    stand = vector3(461.46, -996.9, 29.69)},
    { coords = vector4(462.73, -997.32, 30.68, 0.0),    stand = vector3(462.73, -996.9, 29.69)},
    { coords = vector4(460.06, -998.17, 30.68, 180.0),  stand = vector3(460.06, -998.75, 29.69)},
    { coords = vector4(461.46, -998.17, 30.68, 180.0),  stand = vector3(461.46, -998.75, 29.69)},
    { coords = vector4(462.73, -998.17, 30.68, 180.0),  stand = vector3(462.73, -998.75, 29.69)},
    --[[ Captain Office ]]--
    { coords = vector4(461.39, -985.56, 30.68, 180.0),  stand = vector3(460.56, -985.39, 29.69)},
    { coords = vector4(460.99, -987.48, 30.68, 340.31), stand = vector3(461.46, -987.82, 29.69)},
    { coords = vector4(462.08, -987.44, 30.68, 18.01),  stand = vector3(461.46, -987.82, 29.69)},
    { coords = vector4(461.09, -990.68, 30.68, 0.0),    stand = vector3(461.68, -990.05, 29.69)},
    { coords = vector4(462.24, -990.68, 30.68, 0.0),    stand = vector3(461.68, -990.05, 29.69)},
    --[[ Break Room ]]--
    { coords = vector4(459.53, -980.51, 30.68, 270.0),  stand = vector3(460.20, -981.13, 29.69)},
    { coords = vector4(459.53, -981.64, 30.68, 270.0),  stand = vector3(460.20, -981.13, 29.69)},
    { coords = vector4(462.01, -978.54, 30.68, 338.71), stand = vector3(462.49, -979.33, 29.69)},
    { coords = vector4(462.96, -978.60, 30.68, 18.26),  stand = vector3(462.49, -979.33, 29.69)},
    { coords = vector4(461.93, -977.22, 30.68, 200.58), stand = vector3(462.43, -976.74, 29.69)},
    { coords = vector4(463.00, -977.13, 30.68, 147.96), stand = vector3(462.43, -976.74, 29.69)},
    --[[ Armory ]]--
    { coords = vector4(483.06, -998.76, 30.68, 176.36), stand = vector3(483.82, -998.62, 29.69)},
    --[[ Hallway between Stairs ]]--
    { coords = vector4(464.70, -985.33, 30.68, 270.98), stand = vector3(465.31, -985.26, 30.69)},
    { coords = vector4(464.67, -984.30, 30.68, 279.32), stand = vector3(465.31, -984.25, 30.69)},
    { coords = vector4(464.73, -983.34, 30.68, 270.98), stand = vector3(465.31, -983.32, 30.69)},
    { coords = vector4(464.70, -982.39, 30.68, 279.07), stand = vector3(465.31, -982.33, 30.69)},
    --[[ Hallway near Armory ]]--
    { coords = vector4(472.84, -1000.66, 30.68, 180.0), stand = vector3(472.84, -1001.2, 29.69)},
    { coords = vector4(474.84, -1000.66, 30.68, 180.0), stand = vector3(474.84, -1001.2, 29.69)},
    { coords = vector4(475.69, -1000.66, 30.68, 180.0), stand = vector3(475.69, -1001.2, 29.69)},
    --[[ Reception ]]--
    { coords = vector4(443.38, -980.03, 30.68, 45.67),  stand = vector3(443.89, -980.61, 29.69)},
    { coords = vector4(443.38, -983.74, 30.68, 131.23), stand = vector3(444.15, -983.29, 29.69)},
    --[[ Office Area ]]--
    { coords = vector4(449.61, -991.07, 30.68, 140.0),  stand = vector3(449.10, -991.52, 29.69)},
    { coords = vector4(449.03, -990.43, 30.68, 140.0),  stand = vector3(448.51, -990.88, 29.69)},
    { coords = vector4(448.78, -985.69, 30.68, 40.0),   stand = vector3(448.37, -985.18, 29.69)},
    { coords = vector4(449.39, -985.23, 30.68, 40.0),   stand = vector3(448.95, -984.70, 29.69)},
    { coords = vector4(449.39, -982.31, 30.68, 140.0),  stand = vector3(449.06, -982.82, 29.69)},
    { coords = vector4(448.76, -981.84, 30.68, 140.0),  stand = vector3(448.40, -982.42, 29.69)},
    { coords = vector4(449.04, -977.14, 30.68, 40.0),   stand = vector3(448.61, -976.71, 29.69)},
    { coords = vector4(449.55, -976.57, 30.68, 40.0),   stand = vector3(449.04, -976.17, 29.69)},
    { coords = vector4(454.66, -990.88, 30.68, 0.0),    stand = vector3(454.70, -990.15, 29.69)},
    { coords = vector4(453.25, -990.10, 30.68, 172.62), stand = vector3(453.27, -989.36, 29.69)},
    { coords = vector4(450.06, -988.28, 30.68, 82.12),  stand = vector3(450.82, -988.38, 29.69)},
    { coords = vector4(449.14, -986.80, 30.68, 269.50), stand = vector3(450.00, -986.78, 29.69)},
    { coords = vector4(450.14, -979.92, 30.68, 82.12),  stand = vector3(450.93, -980.01, 29.69)},
    { coords = vector4(449.14, -978.30, 30.68, 269.50), stand = vector3(449.98, -978.28, 29.69)},
    { coords = vector4(451.74, -976.48, 30.68, 180.00), stand = vector3(451.73, -977.40, 29.69)},
    { coords = vector4(453.18, -977.41, 30.68, 352.62), stand = vector3(453.09, -978.15, 29.69)},
    { coords = vector4(453.26, -979.48, 30.68, 172.62), stand = vector3(453.27, -978.77, 29.69)},
    { coords = vector4(454.66, -980.44, 30.68, 0.0),    stand = vector3(454.63, -979.65, 29.69)},
    { coords = vector4(453.63, -982.13, 30.68, 352.62), stand = vector3(453.46, -982.84, 29.69)},
    { coords = vector4(452.18, -981.22, 30.68, 180.0),  stand = vector3(452.25, -981.86, 29.69)},
    { coords = vector4(452.20, -986.25, 30.68, 0.0),    stand = vector3(452.16, -985.49, 29.69)},
    { coords = vector4(453.70, -985.38, 30.68, 172.62), stand = vector3(453.70, -984.71, 29.69)},
    { coords = vector4(454.67, -987.22, 30.68, 180.0),  stand = vector3(454.77, -987.74, 29.69)},
    { coords = vector4(453.17, -988.07, 30.68, 352.62), stand = vector3(453.09, -988.68, 29.69)},

    --[[ LOWER FLOOR FLOOR ]]--
    --[[ Processing ]]--
    { coords = vector4(473.05, -1005.74, 26.27, 196.06),stand = vector3(473.81, -1005.66, 25.27)},
    { coords = vector4(473.14, -1010.50, 26.27, 0.0),   stand = vector3(473.16, -1010.08, 25.27)},
    --[[ Mugshot ]]--
    { coords = vector4(474.13, -1015.14, 26.27, 0.0),   stand = vector3(474.91, -1015.07, 25.27)},
    --[[ Hallway near lineup ]]--
    { coords = vector4(482.33, -1002.0, 26.27, 90.0),   stand = vector3(481.90, -1002.0, 25.27)},
    --[[ Identification ]]--
    { coords = vector4(478.62, -999.73, 26.27, 90.0),   stand = vector3(478.03, -999.73, 25.27)},
    { coords = vector4(472.87, -998.45, 26.27, 197.26), stand = vector3(472.99, -998.87, 25.27)},
    --[[ Hallway near identification ]]--
    { coords = vector4(478.82, -992.17, 26.27, 90.0),   stand = vector3(478.14, -992.84, 25.27)},
    { coords = vector4(478.82, -993.60, 26.27, 90.0),   stand = vector3(478.14, -992.84, 25.27)},
    --[[ Evidence ]]--
    { coords = vector4(472.45, -990.51, 26.27, 256.05), stand = vector3(472.52, -991.35, 25.27)},
    --[[ Observation I ]]--
    { coords = vector4(486.35, -984.95, 26.27, 161.93), stand = vector3(486.51, -984.43, 25.27)},
    { coords = vector4(485.22, -984.98, 26.27, 172.94), stand = vector3(485.28, -984.34, 25.27)},
    --[[ Observation II ]]--
    { coords = vector4(486.35, -993.09, 26.27, 161.93), stand = vector3(486.51, -992.47, 25.27)},
    { coords = vector4(485.22, -993.13, 26.27, 172.94), stand = vector3(485.30, -992.43, 25.27)},
    --[[ Interrogation I ]]--
    { coords = vector4(486.79, -987.81, 26.27, 166.94), stand = vector3(486.91, -987.23, 25.27)},
    { coords = vector4(485.05, -987.81, 26.27, 200.82), stand = vector3(485.21, -987.19, 25.27)},
    { coords = vector4(485.47, -989.79, 26.27, 352.67), stand = vector3(485.32, -990.40, 25.27)},
    { coords = vector4(486.52, -989.86, 26.27, 1.54),   stand = vector3(486.53, -990.48, 25.27)},
    --[[ Interrogation II ]]--
    { coords = vector4(486.79, -995.86, 26.27, 166.94), stand = vector3(487.05, -995.27, 25.27)},
    { coords = vector4(485.50, -995.86, 26.27, 200.82), stand = vector3(485.21, -995.31, 25.27)},
    { coords = vector4(485.47, -997.84, 26.27, 352.67), stand = vector3(485.39, -998.49, 25.27)},
    { coords = vector4(486.52, -997.91, 26.27, 1.54),   stand = vector3(486.55, -998.53, 25.27)},
    --[[ Hallway near garage ]]--
    { coords = vector4(464.37, -987.63, 26.27, 270.0),  stand = vector3(465.17, -987.63, 25.27)},
    { coords = vector4(464.37, -986.06, 26.27, 270.0),  stand = vector3(465.17, -986.06, 25.27)},
    { coords = vector4(464.37, -984.53, 26.27, 270.0),  stand = vector3(465.17, -984.53, 25.27)},

    --[[ UPPER FLOOR ]]--
    --[[ Dispatch ]]--
    { coords = vector4(448.29, -998.79, 34.97, 180.0),  stand = vector3(448.23, -998.10, 33.97)},
    { coords = vector4(446.08, -998.81, 34.97, 180.0),  stand = vector3(446.08, -998.10, 33.97)},
    { coords = vector4(443.91, -998.82, 34.97, 180.0),  stand = vector3(443.87, -998.10, 33.97)},
    { coords = vector4(441.64, -998.81, 34.97, 180.0),  stand = vector3(441.61, -998.10, 33.97)},
    { coords = vector4(440.62, -996.60, 34.97, 0.0),    stand = vector3(440.62, -997.33, 33.97)},
    { coords = vector4(443.95, -996.54, 34.97, 0.0),    stand = vector3(443.89, -997.33, 33.97)},
    --[[ Cozy Corner ]]--
    { coords = vector4(440.30, -975.32, 34.97, 270.0),  stand = vector3(441.14, -974.80, 33.97)},
    { coords = vector4(440.30, -974.17, 34.97, 270.0),  stand = vector3(441.14, -974.80, 33.97)},
    { coords = vector4(447.47, -976.51, 34.97, 0.0),    stand = vector3(447.47, -976.01, 33.97)},
    --[[ Open Space ]]--
    { coords = vector4(447.47, -977.11, 34.97, 180.0),  stand = vector3(447.56, -977.62, 33.97)},
    { coords = vector4(458.49, -974.36, 34.97, 180.0),  stand = vector3(458.52, -974.95, 33.97)},
    { coords = vector4(459.43, -974.36, 34.97, 180.0),  stand = vector3(459.46, -974.95, 33.97)},
    { coords = vector4(460.41, -974.36, 34.97, 180.0),  stand = vector3(460.38, -974.95, 33.97)},
    { coords = vector4(459.62, -994.64, 34.97, 0.0),    stand = vector3(459.62, -993.94, 33.97)},
    { coords = vector4(458.82, -994.64, 34.97, 0.0),    stand = vector3(458.73, -993.94, 33.97)},
    { coords = vector4(458.03, -994.64, 34.97, 0.0),    stand = vector3(457.95, -993.94, 33.97)},
    { coords = vector4(444.94, -994.64, 34.97, 0.0),    stand = vector3(444.96, -993.94, 33.97)},
    { coords = vector4(444.00, -994.63, 34.97, 0.0),    stand = vector3(444.02, -993.94, 33.97)},
    { coords = vector4(443.02, -994.63, 34.97, 0.0),    stand = vector3(442.96, -993.94, 33.97)},
    --[[ Meeting ]]--
    { coords = vector4(459.04, -988.61, 34.97, 357.5),  stand = vector3(459.05, -989.21, 33.97)},
    { coords = vector4(460.09, -988.61, 34.97, 4.72),   stand = vector3(460.17, -989.27, 33.97)},
    { coords = vector4(461.86, -987.40, 34.97, 91.71),  stand = vector3(462.77, -987.33, 33.97)},
    { coords = vector4(461.86, -987.40, 34.97, 91.71),  stand = vector3(462.73, -986.47, 33.97)},
    { coords = vector4(461.87, -985.21, 34.97, 91.71),  stand = vector3(462.72, -985.09, 33.97)},
    { coords = vector4(461.89, -984.10, 34.97, 91.71),  stand = vector3(462.66, -984.13, 33.97)},
    { coords = vector4(460.02, -983.14, 34.97, 176.84), stand = vector3(460.09, -982.27, 33.97)},
    { coords = vector4(458.92, -983.11, 34.97, 180.26), stand = vector3(458.95, -982.27, 33.97)},
    --[[ Training ]]--
    { coords = vector4(443.47, -988.48, 34.97, 90.0),   stand = vector3(444.13, -988.44, 33.97)},
    { coords = vector4(443.47, -988.48, 34.97, 90.0),   stand = vector3(444.13, -987.45, 33.97)},
    { coords = vector4(443.48, -983.93, 34.97, 90.0),   stand = vector3(444.13, -983.85, 33.97)},
    { coords = vector4(443.47, -982.93, 34.97, 90.0),   stand = vector3(444.13, -982.86, 33.97)},
    { coords = vector4(445.60, -988.51, 34.97, 90.0),   stand = vector3(446.26, -988.44, 33.97)},
    { coords = vector4(445.60, -987.61, 34.97, 90.0),   stand = vector3(446.26, -987.45, 33.97)},
    { coords = vector4(445.60, -983.89, 34.97, 90.0),   stand = vector3(446.26, -983.85, 33.97)},
    { coords = vector4(445.59, -982.99, 34.97, 90.0),   stand = vector3(446.26, -982.86, 33.97)},
    { coords = vector4(447.77, -988.49, 34.97, 90.0),   stand = vector3(448.45, -988.44, 33.97)},
    { coords = vector4(447.78, -987.59, 34.97, 90.0),   stand = vector3(448.45, -987.45, 33.97)},
    { coords = vector4(447.77, -983.86, 34.97, 90.0),   stand = vector3(448.45, -983.85, 33.97)},
    { coords = vector4(447.76, -982.94, 34.97, 90.0),   stand = vector3(448.45, -982.86, 33.97)},
}








