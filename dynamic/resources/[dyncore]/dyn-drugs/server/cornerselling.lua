local StolenDrugs = {}

local function getAvailableDrugs(source)
    local AvailableDrugs = {}
    local Player = DynCore.Functions.GetPlayer(source)

    if not Player then return nil end

    for k in pairs(Config.DrugsPrice) do
        local item = Player.Functions.GetItemByName(k)

        if item then
            AvailableDrugs[#AvailableDrugs + 1] = {
                item = item.name,
                amount = item.amount,
                label = DynCore.Shared.Items[item.name]['label']
            }
        end
    end
    return table.type(AvailableDrugs) ~= 'empty' and AvailableDrugs or nil
end

DynCore.Functions.CreateCallback('dyn-drugs:server:cornerselling:getAvailableDrugs', function(source, cb)
    cb(getAvailableDrugs(source))
end)

RegisterNetEvent('dyn-drugs:server:giveStealItems', function(drugType, amount)
    local src = source
    local Player = DynCore.Functions.GetPlayer(src)
    if not Player or StolenDrugs == {} then return end
    for k, v in pairs(StolenDrugs) do
        if drugType == v.item and amount == v.amount then
            exports['dyn-inventory']:AddItem(src, drugType, amount, false, false, 'dyn-drugs:server:giveStealItems')
            table.remove(StolenDrugs, k)
        end
    end
end)

RegisterNetEvent('dyn-drugs:server:sellCornerDrugs', function(drugType, amount, price)
    local src = source
    local Player = DynCore.Functions.GetPlayer(src)
    local availableDrugs = getAvailableDrugs(src)
    if not availableDrugs or not Player then return end
    local item = availableDrugs[drugType].item
    local hasItem = Player.Functions.GetItemByName(item)
    if hasItem.amount >= amount then
        TriggerClientEvent('DynCore:Notify', src, Lang:t('success.offer_accepted'), 'success')
        exports['dyn-inventory']:RemoveItem(src, item, amount, false, 'dyn-drugs:server:sellCornerDrugs')
        Player.Functions.AddMoney('cash', price, 'dyn-drugs:server:sellCornerDrugs')
        TriggerClientEvent('dyn-inventory:client:ItemBox', src, DynCore.Shared.Items[item], 'remove')
        TriggerClientEvent('dyn-drugs:client:refreshAvailableDrugs', src, getAvailableDrugs(src))
    else
        TriggerClientEvent('dyn-drugs:client:cornerselling', src)
    end
end)

RegisterNetEvent('dyn-drugs:server:robCornerDrugs', function(drugType, amount)
    local src = source
    local Player = DynCore.Functions.GetPlayer(src)
    local availableDrugs = getAvailableDrugs(src)
    if not availableDrugs or not Player then return end
    local item = availableDrugs[drugType].item
    exports['dyn-inventory']:RemoveItem(src, item, amount, false, 'dyn-drugs:server:robCornerDrugs')
    table.insert(StolenDrugs, { item = item, amount = amount })
    TriggerClientEvent('dyn-inventory:client:ItemBox', src, DynCore.Shared.Items[item], 'remove')
    TriggerClientEvent('dyn-drugs:client:refreshAvailableDrugs', src, getAvailableDrugs(src))
end)
