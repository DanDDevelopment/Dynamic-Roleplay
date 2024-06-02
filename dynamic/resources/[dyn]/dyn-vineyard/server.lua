local QBCore = exports['dyn-core']:GetCoreObject()

RegisterNetEvent('dyn-vineyard:server:getGrapes', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(Config.GrapeAmount.min, Config.GrapeAmount.max)
    exports['dyn-inventory']:AddItem(source, 'grape', amount, false, false, 'dyn-vineyard:server:getGrapes')
    TriggerClientEvent('dyn-inventory:client:ItemBox', source, QBCore.Shared.Items['grape'], 'add')
end)

QBCore.Functions.CreateCallback('dyn-vineyard:server:loadIngredients', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local grape = Player.Functions.GetItemByName('grapejuice')
    if Player.PlayerData.items ~= nil then
        if grape ~= nil then
            if grape.amount >= 23 then
                exports['dyn-inventory']:RemoveItem(src, 'grapejuice', 23, false, 'dyn-vineyard:server:loadIngredients')
                TriggerClientEvent('dyn-inventory:client:ItemBox', source, QBCore.Shared.Items['grapejuice'], 'remove')
                cb(true)
            else
                TriggerClientEvent('QBCore:Notify', source, Lang:t('error.invalid_items'), 'error')
                cb(false)
            end
        else
            TriggerClientEvent('QBCore:Notify', source, Lang:t('error.invalid_items'), 'error')
            cb(false)
        end
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t('error.no_items'), 'error')
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('dyn-vineyard:server:grapeJuice', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local grape = Player.Functions.GetItemByName('grape')
    if Player.PlayerData.items ~= nil then
        if grape ~= nil then
            if grape.amount >= 16 then
                exports['dyn-inventory']:RemoveItem(src, 'grape', 16, false, 'dyn-vineyard:server:grapeJuice')
                TriggerClientEvent('dyn-inventory:client:ItemBox', source, QBCore.Shared.Items['grape'], 'remove')
                cb(true)
            else
                TriggerClientEvent('QBCore:Notify', source, Lang:t('error.invalid_items'), 'error')
                cb(false)
            end
        else
            TriggerClientEvent('QBCore:Notify', source, Lang:t('error.invalid_items'), 'error')
            cb(false)
        end
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t('error.no_items'), 'error')
        cb(false)
    end
end)

RegisterNetEvent('dyn-vineyard:server:receiveWine', function()
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local amount = math.random(Config.WineAmount.min, Config.WineAmount.max)
    exports['dyn-inventory']:AddItem(source, 'wine', amount, false, false, 'dyn-vineyard:server:receiveWine')
    TriggerClientEvent('dyn-inventory:client:ItemBox', source, QBCore.Shared.Items['wine'], 'add')
end)

RegisterNetEvent('dyn-vineyard:server:receiveGrapeJuice', function()
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local amount = math.random(Config.GrapeJuiceAmount.min, Config.GrapeJuiceAmount.max)
    exports['dyn-inventory']:AddItem(source, 'grapejuice', amount, false, false, 'dyn-vineyard:server:receiveGrapeJuice')
    TriggerClientEvent('dyn-inventory:client:ItemBox', source, QBCore.Shared.Items['grapejuice'], 'add')
end)
