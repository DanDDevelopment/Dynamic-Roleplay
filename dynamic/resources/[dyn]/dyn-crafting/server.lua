local QBCore = exports['dyn-core']:GetCoreObject()

-- Functions

local function IncreasePlayerXP(source, xpGain, xpType)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local currentXP = Player.Functions.GetRep(xpType)
        local newXP = currentXP + xpGain
        Player.Functions.AddRep(xpType, newXP)
        TriggerClientEvent('QBCore:Notify', source, string.format(Lang:t('notifications.xpGain'), xpGain, xpType), 'success')
    end
end

-- Callbacks

QBCore.Functions.CreateCallback('crafting:getPlayerInventory', function(source, cb)
    local player = QBCore.Functions.GetPlayer(source)
    if player then
        cb(player.PlayerData.items)
    else
        cb({})
    end
end)

-- Events
RegisterServerEvent('dyn-crafting:server:removeMaterials', function(itemName, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        exports['dyn-inventory']:RemoveItem(src, itemName, amount, false, 'dyn-crafting:server:removeMaterials')
        TriggerClientEvent('dyn-inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'remove')
    end
end)

RegisterNetEvent('dyn-crafting:server:removeCraftingTable', function(benchType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    exports['dyn-inventory']:RemoveItem(src, benchType, 1, false, 'dyn-crafting:server:removeCraftingTable')
    TriggerClientEvent('dyn-inventory:client:ItemBox', src, QBCore.Shared.Items[benchType], 'remove')
    TriggerClientEvent('QBCore:Notify', src, Lang:t('notifications.tablePlace'), 'success')
end)

RegisterNetEvent('dyn-crafting:server:addCraftingTable', function(benchType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not exports['dyn-inventory']:AddItem(src, benchType, 1, false, false, 'dyn-crafting:server:addCraftingTable') then return end
    TriggerClientEvent('dyn-inventory:client:ItemBox', src, QBCore.Shared.Items[benchType], 'add')
end)

RegisterNetEvent('dyn-crafting:server:receiveItem', function(craftedItem, requiredItems, amountToCraft, xpGain, xpType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local canGive = true
    for _, requiredItem in ipairs(requiredItems) do
        if not exports['dyn-inventory']:RemoveItem(src, requiredItem.item, requiredItem.amount, false, 'dyn-crafting:server:receiveItem') then
            canGive = false
            return
        end
        TriggerClientEvent('dyn-inventory:client:ItemBox', src, QBCore.Shared.Items[requiredItem.item], 'remove')
    end
    if canGive then
        if not exports['dyn-inventory']:AddItem(src, craftedItem, amountToCraft, false, false, 'dyn-crafting:server:receiveItem') then return end
        TriggerClientEvent('dyn-inventory:client:ItemBox', src, QBCore.Shared.Items[craftedItem], 'add')
        TriggerClientEvent('QBCore:Notify', src, string.format(Lang:t('notifications.craftMessage'), QBCore.Shared.Items[craftedItem].label), 'success')
        IncreasePlayerXP(src, xpGain, xpType)
    end
end)

-- Items

for benchType, _ in pairs(Config) do
    QBCore.Functions.CreateUseableItem(benchType, function(source)
        TriggerClientEvent('dyn-crafting:client:useCraftingTable', source, benchType)
    end)
end
