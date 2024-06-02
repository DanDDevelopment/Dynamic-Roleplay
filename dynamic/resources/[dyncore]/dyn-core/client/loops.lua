CreateThread(function()
    while true do
        local sleep = 0
        if LocalPlayer.state.isLoggedIn then
            sleep = (1000 * 60) * DynCore.Config.UpdateInterval
            TriggerServerEvent('DynCore:UpdatePlayer')
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        if LocalPlayer.state.isLoggedIn then
            if (DynCore.PlayerData.metadata['hunger'] <= 0 or DynCore.PlayerData.metadata['thirst'] <= 0) and not (DynCore.PlayerData.metadata['isdead'] or DynCore.PlayerData.metadata['inlaststand']) then
                local ped = PlayerPedId()
                local currentHealth = GetEntityHealth(ped)
                local decreaseThreshold = math.random(5, 10)
                SetEntityHealth(ped, currentHealth - decreaseThreshold)
            end
        end
        Wait(DynCore.Config.StatusInterval)
    end
end)
