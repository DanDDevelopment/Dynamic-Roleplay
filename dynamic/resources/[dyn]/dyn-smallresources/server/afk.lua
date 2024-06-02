local QBCore = exports['dyn-core']:GetCoreObject()

RegisterNetEvent('KickForAFK', function()
	DropPlayer(source, Lang:t("afk.kick_message"))
end)

QBCore.Functions.CreateCallback('dyn-afkkick:server:GetPermissions', function(source, cb)
    cb(QBCore.Functions.GetPermission(source))
end)
