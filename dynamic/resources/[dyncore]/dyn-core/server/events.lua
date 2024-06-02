-- Event Handler

AddEventHandler('chatMessage', function(_, _, message)
    if string.sub(message, 1, 1) == '/' then
        CancelEvent()
        return
    end
end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    if not DynCore.Players[src] then return end
    local Player = DynCore.Players[src]
    TriggerEvent('dyn-log:server:CreateLog', 'joinleave', 'Dropped', 'red', '**' .. GetPlayerName(src) .. '** (' .. Player.PlayerData.license .. ') left..' .. '\n **Reason:** ' .. reason)
    TriggerEvent('DynCore:Server:PlayerDropped', Player)
    Player.Functions.Save()
    DynCore.Player_Buckets[Player.PlayerData.license] = nil
    DynCore.Players[src] = nil
end)

-- Player Connecting

local function onPlayerConnecting(name, _, deferrals)
    local src = source
    deferrals.defer()

    if DynCore.Config.Server.Closed and not IsPlayerAceAllowed(src, 'qbadmin.join') then
        return deferrals.done(DynCore.Config.Server.ClosedReason)
    end

    if DynCore.Config.Server.Whitelist then
        Wait(0)
        deferrals.update(string.format(Lang:t('info.checking_whitelisted'), name))
        if not DynCore.Functions.IsWhitelisted(src) then
            return deferrals.done(Lang:t('error.not_whitelisted'))
        end
    end

    Wait(0)
    deferrals.update(string.format('Hello %s. Your license is being checked', name))
    local license = DynCore.Functions.GetIdentifier(src, 'license')

    if not license then
        return deferrals.done(Lang:t('error.no_valid_license'))
    elseif DynCore.Config.Server.CheckDuplicateLicense and DynCore.Functions.IsLicenseInUse(license) then
        return deferrals.done(Lang:t('error.duplicate_license'))
    end

    Wait(0)
    deferrals.update(string.format(Lang:t('info.checking_ban'), name))

    local success, isBanned, reason = pcall(DynCore.Functions.IsPlayerBanned, src)
    if not success then return deferrals.done(Lang:t('error.connecting_database_error')) end
    if isBanned then return deferrals.done(reason) end

    Wait(0)
    deferrals.update(string.format(Lang:t('info.join_server'), name))
    deferrals.done()

    TriggerClientEvent('DynCore:Client:SharedUpdate', src, DynCore.Shared)
end

AddEventHandler('playerConnecting', onPlayerConnecting)

-- Open & Close Server (prevents players from joining)

RegisterNetEvent('DynCore:Server:CloseServer', function(reason)
    local src = source
    if DynCore.Functions.HasPermission(src, 'admin') then
        reason = reason or 'No reason specified'
        DynCore.Config.Server.Closed = true
        DynCore.Config.Server.ClosedReason = reason
        for k in pairs(DynCore.Players) do
            if not DynCore.Functions.HasPermission(k, DynCore.Config.Server.WhitelistPermission) then
                DynCore.Functions.Kick(k, reason, nil, nil)
            end
        end
    else
        DynCore.Functions.Kick(src, Lang:t('error.no_permission'), nil, nil)
    end
end)

RegisterNetEvent('DynCore:Server:OpenServer', function()
    local src = source
    if DynCore.Functions.HasPermission(src, 'admin') then
        DynCore.Config.Server.Closed = false
    else
        DynCore.Functions.Kick(src, Lang:t('error.no_permission'), nil, nil)
    end
end)

-- Callback Events --

-- Client Callback
RegisterNetEvent('DynCore:Server:TriggerClientCallback', function(name, ...)
    if DynCore.ClientCallbacks[name] then
        DynCore.ClientCallbacks[name](...)
        DynCore.ClientCallbacks[name] = nil
    end
end)

-- Server Callback
RegisterNetEvent('DynCore:Server:TriggerCallback', function(name, ...)
    local src = source
    DynCore.Functions.TriggerCallback(name, src, function(...)
        TriggerClientEvent('DynCore:Client:TriggerCallback', src, name, ...)
    end, ...)
end)

-- Player

RegisterNetEvent('DynCore:UpdatePlayer', function()
    local src = source
    local Player = DynCore.Functions.GetPlayer(src)
    if not Player then return end
    local newHunger = Player.PlayerData.metadata['hunger'] - DynCore.Config.Player.HungerRate
    local newThirst = Player.PlayerData.metadata['thirst'] - DynCore.Config.Player.ThirstRate
    if newHunger <= 0 then
        newHunger = 0
    end
    if newThirst <= 0 then
        newThirst = 0
    end
    Player.Functions.SetMetaData('thirst', newThirst)
    Player.Functions.SetMetaData('hunger', newHunger)
    TriggerClientEvent('hud:client:UpdateNeeds', src, newHunger, newThirst)
    Player.Functions.Save()
end)

RegisterNetEvent('DynCore:ToggleDuty', function()
    local src = source
    local Player = DynCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.onduty then
        Player.Functions.SetJobDuty(false)
        TriggerClientEvent('DynCore:Notify', src, Lang:t('info.off_duty'))
    else
        Player.Functions.SetJobDuty(true)
        TriggerClientEvent('DynCore:Notify', src, Lang:t('info.on_duty'))
    end

    TriggerEvent('DynCore:Server:SetDuty', src, Player.PlayerData.job.onduty)
    TriggerClientEvent('DynCore:Client:SetDuty', src, Player.PlayerData.job.onduty)
end)

-- BaseEvents

-- Vehicles
RegisterServerEvent('baseevents:enteringVehicle', function(veh, seat, modelName)
    local src = source
    local data = {
        vehicle = veh,
        seat = seat,
        name = modelName,
        event = 'Entering'
    }
    TriggerClientEvent('DynCore:Client:VehicleInfo', src, data)
end)

RegisterServerEvent('baseevents:enteredVehicle', function(veh, seat, modelName)
    local src = source
    local data = {
        vehicle = veh,
        seat = seat,
        name = modelName,
        event = 'Entered'
    }
    TriggerClientEvent('DynCore:Client:VehicleInfo', src, data)
end)

RegisterServerEvent('baseevents:enteringAborted', function()
    local src = source
    TriggerClientEvent('DynCore:Client:AbortVehicleEntering', src)
end)

RegisterServerEvent('baseevents:leftVehicle', function(veh, seat, modelName)
    local src = source
    local data = {
        vehicle = veh,
        seat = seat,
        name = modelName,
        event = 'Left'
    }
    TriggerClientEvent('DynCore:Client:VehicleInfo', src, data)
end)

-- Items

-- This event is exploitable and should not be used. It has been deprecated, and will be removed soon.
RegisterNetEvent('DynCore:Server:UseItem', function(item)
    print(string.format('%s triggered DynCore:Server:UseItem by ID %s with the following data. This event is deprecated due to exploitation, and will be removed soon. Check dyn-inventory for the right use on this event.', GetInvokingResource(), source))
    DynCore.Debug(item)
end)

-- This event is exploitable and should not be used. It has been deprecated, and will be removed soon. function(itemName, amount, slot)
RegisterNetEvent('DynCore:Server:RemoveItem', function(itemName, amount)
    local src = source
    print(string.format('%s triggered DynCore:Server:RemoveItem by ID %s for %s %s. This event is deprecated due to exploitation, and will be removed soon. Adjust your events accordingly to do this server side with player functions.', GetInvokingResource(), src, amount, itemName))
end)

-- This event is exploitable and should not be used. It has been deprecated, and will be removed soon. function(itemName, amount, slot, info)
RegisterNetEvent('DynCore:Server:AddItem', function(itemName, amount)
    local src = source
    print(string.format('%s triggered DynCore:Server:AddItem by ID %s for %s %s. This event is deprecated due to exploitation, and will be removed soon. Adjust your events accordingly to do this server side with player functions.', GetInvokingResource(), src, amount, itemName))
end)

-- Non-Chat Command Calling (ex: dyn-adminmenu)

RegisterNetEvent('DynCore:CallCommand', function(command, args)
    local src = source
    if not DynCore.Commands.List[command] then return end
    local Player = DynCore.Functions.GetPlayer(src)
    if not Player then return end
    local hasPerm = DynCore.Functions.HasPermission(src, 'command.' .. DynCore.Commands.List[command].name)
    if hasPerm then
        if DynCore.Commands.List[command].argsrequired and #DynCore.Commands.List[command].arguments ~= 0 and not args[#DynCore.Commands.List[command].arguments] then
            TriggerClientEvent('DynCore:Notify', src, Lang:t('error.missing_args2'), 'error')
        else
            DynCore.Commands.List[command].callback(src, args)
        end
    else
        TriggerClientEvent('DynCore:Notify', src, Lang:t('error.no_access'), 'error')
    end
end)

-- Use this for player vehicle spawning
-- Vehicle server-side spawning callback (netId)
-- use the netid on the client with the NetworkGetEntityFromNetworkId native
-- convert it to a vehicle via the NetToVeh native
DynCore.Functions.CreateCallback('DynCore:Server:SpawnVehicle', function(source, cb, model, coords, warp)
    local veh = DynCore.Functions.SpawnVehicle(source, model, coords, warp)
    cb(NetworkGetNetworkIdFromEntity(veh))
end)

-- Use this for long distance vehicle spawning
-- vehicle server-side spawning callback (netId)
-- use the netid on the client with the NetworkGetEntityFromNetworkId native
-- convert it to a vehicle via the NetToVeh native
DynCore.Functions.CreateCallback('DynCore:Server:CreateVehicle', function(source, cb, model, coords, warp)
    local veh = DynCore.Functions.CreateAutomobile(source, model, coords, warp)
    cb(NetworkGetNetworkIdFromEntity(veh))
end)

--DynCore.Functions.CreateCallback('DynCore:HasItem', function(source, cb, items, amount)
-- https://github.com/DynCore-framework/dyn-inventory/blob/e4ef156d93dd1727234d388c3f25110c350b3bcf/server/main.lua#L2066
--end)
