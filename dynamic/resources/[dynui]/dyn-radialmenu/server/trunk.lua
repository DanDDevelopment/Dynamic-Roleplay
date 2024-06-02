local DynCore = exports['dyn-core']:GetCoreObject()
local trunkBusy = {}

RegisterNetEvent('dyn-radialmenu:trunk:server:Door', function(open, plate, door)
    TriggerClientEvent('dyn-radialmenu:trunk:client:Door', -1, plate, door, open)
end)

RegisterNetEvent('dyn-trunk:server:setTrunkBusy', function(plate, busy)
    trunkBusy[plate] = busy
end)

RegisterNetEvent('dyn-trunk:server:KidnapTrunk', function(targetId, closestVehicle)
    TriggerClientEvent('dyn-trunk:client:KidnapGetIn', targetId, closestVehicle)
end)

DynCore.Functions.CreateCallback('dyn-trunk:server:getTrunkBusy', function(_, cb, plate)
    if trunkBusy[plate] then cb(true) return end
    cb(false)
end)

DynCore.Commands.Add("getintrunk", Lang:t("general.getintrunk_command_desc"), {}, false, function(source)
    TriggerClientEvent('dyn-trunk:client:GetIn', source)
end)

DynCore.Commands.Add("putintrunk", Lang:t("general.putintrunk_command_desc"), {}, false, function(source)
    TriggerClientEvent('dyn-trunk:server:KidnapTrunk', source)
end)