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

ApexConfig = {}
ApexConfig.Debug = true

-- FRAMEWORKS + RESOURCE NAMES
-------------------------------------
--[[- FRAMEWORK: (DynCore, esx)
    - DynCore
    - esx
]]--
--[[- RESOURCE NAME: (dyn-core, es_extended)
    - dyn-core
    - es_extended
]]--
ApexConfig.Framework = 'DynCore'
ApexConfig.ResourceName = 'dyn-core'
-------------------------------------

-- BOSSMENU SYSTEMS
-------------------------------------
--[[
    - dyn-bossmenu:client:OpenMenu
    - esx_society:openBossMenu
]]--
ApexConfig.Bossmenu = 'dyn-bossmenu:client:OpenMenu'
-------------------------------------

-- GANGMENU SYSTEMS
-------------------------------------
--[[
    - dyn-gangmenu:client:OpenMenu
    - esx_society:openBossMenu
]]--
ApexConfig.Gangmenu = 'dyn-gangmenu:client:OpenMenu'
-------------------------------------

-- TARGET SYSTEMS
-------------------------------------
--[[
    - dyn-target
    - ox_target
    - qtarget
]]--
ApexConfig.Target = 'dyn-target'
-------------------------------------

-- MENU SYSTEMS
-------------------------------------
--[[
    - dyn-menu
    - ox_lib
]]--
ApexConfig.Menu = 'dyn-menu'
-------------------------------------

-- INPUT SYSTEMS
-------------------------------------
--[[
    - dyn-input
    - ox_lib
]]--
ApexConfig.Input = 'dyn-input'
-------------------------------------


-- INVENTORY SYSTEMS
-------------------------------------
--[[
    - dyn-inventory
    - lj-inventory
    - dyn-inventory
    - qs-inventory
    - ox_inventory
    - codem-inventory (Currently Unavailable)
]]--
ApexConfig.Inventory = 'dyn-inventory'
-------------------------------------

-- PROGRESSBAR SYSTEMS
-------------------------------------
--[[
    - DynCore
    - ox_lib
    - progressBars
]]--
ApexConfig.Progressbar = 'DynCore'
-------------------------------------

-- NOTIFICATION SYSTEMS
-------------------------------------
--[[
    - apex_lib
    - DynCore
    - esx
    - okok
    - codem
    - mythic
    - ps (project sloth)
    - ox_lib
]]--
ApexConfig.Notification = 'DynCore'
-------------------------------------

-- PAYMENT SYSTEMS
-------------------------------------
--[[
    - jim-payments:client:Charge
    - okokBilling:ToggleCreateInvoice
]]--
ApexConfig.Payment = 'jim-payments:client:Charge'
-------------------------------------

-- CLOTHING SYSTEMS
-------------------------------------
--[[
    - dyn-clothing
    - illenium-appearance
    - rcore_clothes
    - esx_skin
]]--
ApexConfig.Clothing = 'dyn-clothing'
-------------------------------------


-- MDT SYSTEMS
-------------------------------------
--[[
    - dyn-mdt
    - al_mdt
    - qs-mdt
    - redutzu-mdt
]]--
ApexConfig.MDT = 'dyn-mdt'
-------------------------------------


-- DISPATCH SYSTEMS
-------------------------------------
--[[
    - DynCore
    - dyn-dispatch
    - qs-dispatch
    - cd_dispatch
]]--
ApexConfig.Dispatch = 'dyn-dispatch'
-------------------------------------


-- PHONE SYSTEMS
-------------------------------------
--[[
    - dyn-phone
    - qs-smartphone
    - gksphone
    - lb-phone
]]--
ApexConfig.Phone = 'dyn-phone'
-------------------------------------


-- FUEL SYSTEMS
-------------------------------------
--[[
    - LegacyFuel
    - esx-sna-fuel
    - dyn-fuel
    - lj-fuel
    - cdn-fuel
    - qs-fuelstations
    - frkn-fuelstation
    - okokGasStation
    - ti_fuel
    - cc-fuel
    - ox_fuel
    - ND_Fuel
    - FRFuel
]]--
ApexConfig.Fuel = 'LegacyFuel'
-------------------------------------


-- GARAGE SYSTEMS
-------------------------------------
--[[
    - dyn-garage
    - cd_garage
    - jg-advancedgarages
    - qs-advancedgarages
]]--
ApexConfig.Garage = 'dyn-garage'
-------------------------------------


-- PRISON SYSTEMS
-------------------------------------
--[[
    - dyn-prison
    - lionheart-jail
    - rcore_prison
    - astudios-penitentiary (If this is being use, remember to set Jailing to false in the apex_lawenforcement config)
]]--
ApexConfig.Jail = 'dyn-prison'
-------------------------------------


-- VEHICLE LOCKSYSTEM SYSTEMS
-------------------------------------
--[[
    - dyn-vehiclekeys
    - qs-vehiclekeys
    - wasabi_carlock
    - jaksam-vehiclekeys
    - F_RealCarKeysSystem
    - fivecode_carkeys
    - stasiek_vehiclekeys
    - t1ger_keys
    - ti_vehicleKeys
    - vehicles_keys
    - xd_locksystem
]]--
ApexConfig.Keylock = 'dyn-vehiclekeys'
-------------------------------------


-- TEXT UI SYSTEMS
-------------------------------------
--[[
    - apex_lib
    - DynCore
    - ox_lib
    - ps (project sloth)
]]--
ApexConfig.TextUI = 'DynCore'
-------------------------------------


-- BUILT-IN FEATURES [PARTIALLY IN DEVELOPMENT]
-------------------------------------
--[[
    - If chat is set to true - Please remove any other chat resource from your server
    - Failure to do so will result in chat conflicts
]]--
ApexConfig.Chat = true

--[[
    - To use our overlay chat (me, med, ool as 3d text), set the settings below to true
    - Don't wanna use them, set them to false
    - Remember to disable the /me command in DynCore if using this!
]]--
ApexConfig.OverlayChat = {              -- Also know as 3D Chat
    me = true,                          -- Default me chat
    med = true,                         -- Special me chat for ems (Could be used to let people know the ems is enroute to the call, etc.)
    ool = true,                         -- Out of character chat locally
    position = {                        -- Don't touch anything inside this, if you don't know what you're doing!
        coordsX = 0,                    -- Move text left or right
        coordsY = 0,                    -- Move text forward or backward
        coordsZ = 1.1                   -- Move text up or down
    },
    Webhook = 'https://discord.com/api/webhooks/1246344774080790548/GU5FV8XzToZUKxLsIfTYqNDpYukAuabg5qx5_O-bGymHK31xmG-uRrJiyD9l13AUtapC',           -- Discord webhook for logging
}
-------------------------------------


-- RESOURCE INFORMATION
-------------------------------------
--[[
    When using this resource, you are not always going to use all the features.
    So keep in mind, that you do not have to set everything. Some features might only be for a few scripts, where others are for everyone.
]]--