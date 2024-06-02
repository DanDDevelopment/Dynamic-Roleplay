local DynCore = exports['dyn-core']:GetCoreObject()

DynCore.Functions.CreateCallback('dyn-scoreboard:server:GetScoreboardData', function(_, cb)
    local totalPlayers = 0
    local policeCount = 0
    local players = {}

    for _, v in pairs(DynCore.Functions.GetQBPlayers()) do
        if v then
            totalPlayers += 1

            if v.PlayerData.job.name == 'police' and v.PlayerData.job.onduty then
                policeCount += 1
            end

            players[v.PlayerData.source] = {}
            players[v.PlayerData.source].optin = DynCore.Functions.IsOptin(v.PlayerData.source)
        end
    end
    cb(totalPlayers, policeCount, players)
end)

RegisterNetEvent('dyn-scoreboard:server:SetActivityBusy', function(activity, bool)
    Config.IllegalActions[activity].busy = bool
    TriggerClientEvent('dyn-scoreboard:client:SetActivityBusy', -1, activity, bool)
end)
