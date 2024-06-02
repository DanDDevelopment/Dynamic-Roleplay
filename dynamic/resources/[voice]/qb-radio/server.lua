local DynCore = exports['dyn-core']:GetCoreObject()

DynCore.Functions.CreateUseableItem("radio", function(source)
    TriggerClientEvent('dyn-radio:use', source)
end)

for channel, config in pairs(Config.RestrictedChannels) do
    exports['pma-voice']:addChannelCheck(channel, function(source)
        local Player = DynCore.Functions.GetPlayer(source)
        return config[Player.PlayerData.job.name] and Player.PlayerData.job.onduty
    end)
end
