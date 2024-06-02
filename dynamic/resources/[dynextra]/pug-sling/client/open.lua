print'Pug Sling 2.0.9'

CreateThread(function()
    local InVehicle
    while true do
        Wait(100)
        local entering = GetVehiclePedIsTryingToEnter(PlayerPedId())
        if entering ~= 0 then
            TriggerEvent("Pug:ReloadGuns:sling", true)
            Wait(2000)
        end
        if IsPedInAnyVehicle(PlayerPedId()) then
            if not InVehicle then
                InVehicle = true
                TriggerEvent("Pug:ReloadGuns:sling", true)
                Wait(2000)
            end
        else
            InVehicle = false
        end
    end
end)

RegisterNetEvent('Pug:ReloadGuns:sling', function(bool)
    ResetAllWeaponsOnBack(bool)
    for _, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(PlayerPedId(), v) then
            SetEntityAsMissionEntity(v, true, true)
            DeleteObject(v)
            DeleteEntity(v)
        end
    end
end)

if not Config.UseOldSlingScript then

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        Wait(3000)
        TriggerEvent("Pug:client:RegisterAllBackWeapons")
    end)
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function()
        Wait(3000)
        TriggerEvent("Pug:client:RegisterAllBackWeapons")
    end)
    
    -- Change this to your notification script if needed
    function SlingNotify(msg, type, length)
        if Framework == "ESX" then
            FWork.ShowNotification(msg)
        elseif Framework == "QBCore" then
            FWork.Functions.Notify(msg, type, length)
        end
    end

    -- INVENTORY HAS ITEM CHECK
    function CheckHasWeapon(Weapon)
        if GetResourceState("qs-inventory") == 'started' then
            local count = exports['qs-inventory']:Search(Weapon)
            if count > 0 then
                return true
            else
                return false
            end
        elseif GetResourceState("dyn-inventory") == 'started' then
            return exports['dyn-inventory']:HasItem(Weapon)
        elseif GetResourceState("ps-inventory") == 'started' then
            return exports['ps-inventory']:HasItem(Weapon)
        elseif GetResourceState("ox_inventory") == 'started' then
            local count = exports.ox_inventory:GetItemCount(Weapon)
            if count > 0 then
                return true
            else
                return false
            end
        end
    end

    local function CheckJobVerified()
        local PlayerJob = Config.FrameworkFunctions.GetPlayer().PlayerData.job.name
        for _,v in pairs(Config.RackCapableJobs) do
            if tostring(v) == tostring(PlayerJob) then
                return true
            end
        end
        return false
    end

    RegisterCommand(Config.WeaponRackCommand, function()
        if CheckJobVerified() then
            --IS IN VEHICLE
            if IsPedInAnyVehicle(PlayerPedId()) then
                local veh = GetVehiclePedIsUsing(PlayerPedId())
                local plate = GetVehicleNumberPlateText(veh)				
                --IS EMERGENCY VEHICLE
                if GetVehicleClass(veh) == 18 then
                    if Framework == "ESX" then
                        if GetResourceState("dyn-inventory") == 'started' or GetResourceState("ps-inventory") == 'started' then
                            TriggerEvent("inventory:client:SetCurrentStash", "Rack".. plate)
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "Rack" .. plate, {
                                maxweight = Config.RackMaxWeight,
                                slots = Config.RackSlots,
                            })
                        elseif GetResourceState("qs-inventory") == 'started' then
                            exports['qs-inventory']:RegisterStash("Rack".. plate, Config.RackSlots, Config.RackMaxWeight) 
                        elseif GetResourceState("ox_inventory") == 'started' then
                            TriggerServerEvent("Pug:server:SlingOpenOxInvRack", "Rack".. plate, Config.RackSlots, Config.RackMaxWeight)
                            exports.ox_inventory:openInventory('stash', "Rack".. plate)
                        end
                    else
                        FWork.Functions.Progressbar("reaching_rack", "Reaching for rack", 4000, false, true, {
                            disableMovement = false,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "move_m@intimidation@cop@unarmed",
                            anim = "idle",
                            flags = 49,
                        }, {}, {}, function()
                            if GetResourceState("dyn-inventory") == 'started' or GetResourceState("ps-inventory") == 'started' then
                                TriggerEvent("inventory:client:SetCurrentStash", "Rack".. plate)
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "Rack" .. plate, {
                                    maxweight = Config.RackMaxWeight,
                                    slots = Config.RackSlots,
                                })
                            elseif GetResourceState("qs-inventory") == 'started' then
                                exports['qs-inventory']:RegisterStash("Rack".. plate, Config.RackSlots, Config.RackMaxWeight) 
                            elseif GetResourceState("ox_inventory") == 'started' then
                                TriggerServerEvent("Pug:server:SlingOpenOxInvRack", "Rack".. plate, Config.RackSlots, Config.RackMaxWeight)
                                exports.ox_inventory:openInventory('stash', "Rack".. plate)
                            end
                        end, function() -- Cancel
                            SlingNotify("Canceled", "error", 4500)
                        end)
                    end
                else
                    SlingNotify("Must be in a emergency service vehicle!", "error")
                end
            else
                SlingNotify("You must be in a vehicle!", "error")
            end
        else
            SlingNotify("You are not a police Officer", "error")
        end
    end)
end