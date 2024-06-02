local DynCore = exports['dyn-core']:GetCoreObject()

CreateThread(function()
    while true do
        Wait(1000)
        GenerateVehicleList()
        Wait((1000 * 60) * 60)
    end
end)

RegisterNetEvent('dyn-scrapyard:server:LoadVehicleList', function()
    local src = source
    TriggerClientEvent('dyn-scapyard:client:setNewVehicles', src, Config.CurrentVehicles)
end)


DynCore.Functions.CreateCallback('dyn-scrapyard:checkOwnerVehicle', function(_, cb, plate)
    local result = MySQL.scalar.await('SELECT `plate` FROM `player_vehicles` WHERE `plate` = ?', { plate })
    if result then
        cb(false)
    else
        cb(true)
    end
end)


RegisterNetEvent('dyn-scrapyard:server:ScrapVehicle', function(listKey)
    local src = source
    local Player = DynCore.Functions.GetPlayer(src)
    if Config.CurrentVehicles[listKey] ~= nil then
        for _ = 1, math.random(2, 4), 1 do
            local item = Config.Items[math.random(1, #Config.Items)]
            exports['dyn-inventory']:AddItem(src, item, math.random(25, 45), false, false, 'dyn-scrapyard:server:ScrapVehicle')
            TriggerClientEvent('dyn-inventory:client:ItemBox', src, DynCore.Shared.Items[item], 'add')
            Wait(500)
        end
        local Luck = math.random(1, 8)
        local Odd = math.random(1, 8)
        if Luck == Odd then
            local random = math.random(10, 20)
            exports['dyn-inventory']:AddItem(src, 'rubber', random, false, false, 'dyn-scrapyard:server:ScrapVehicle')
            TriggerClientEvent('dyn-inventory:client:ItemBox', src, DynCore.Shared.Items['rubber'], 'add')
        end
        Config.CurrentVehicles[listKey] = nil
        TriggerClientEvent('dyn-scapyard:client:setNewVehicles', -1, Config.CurrentVehicles)
    end
end)

function GenerateVehicleList()
    Config.CurrentVehicles = {}
    for i = 1, Config.VehicleCount, 1 do
        local randVehicle = Config.Vehicles[math.random(1, #Config.Vehicles)]
        if not IsInList(randVehicle) then
            Config.CurrentVehicles[i] = randVehicle
        end
    end
    TriggerClientEvent('dyn-scapyard:client:setNewVehicles', -1, Config.CurrentVehicles)
end

function IsInList(name)
    local retval = false
    if Config.CurrentVehicles ~= nil and next(Config.CurrentVehicles) ~= nil then
        for k in pairs(Config.CurrentVehicles) do
            if Config.CurrentVehicles[k] == name then
                retval = true
            end
        end
    end
    return retval
end
