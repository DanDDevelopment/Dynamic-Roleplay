RegisterNetEvent('dyn-radialmenu:server:RemoveStretcher', function(pos, stretcherObject)
    TriggerClientEvent('dyn-radialmenu:client:RemoveStretcherFromArea', -1, pos, stretcherObject)
end)

RegisterNetEvent('dyn-radialmenu:Stretcher:BusyCheck', function(id, type)
    TriggerClientEvent('dyn-radialmenu:Stretcher:client:BusyCheck', id, source, type)
end)

RegisterNetEvent('dyn-radialmenu:server:BusyResult', function(isBusy, otherId, type)
    TriggerClientEvent('dyn-radialmenu:client:Result', otherId, isBusy, type)
end)