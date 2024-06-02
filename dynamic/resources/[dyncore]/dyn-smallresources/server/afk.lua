local DynCore = exports['dyn-core']:GetCoreObject()

RegisterNetEvent('KickForAFK', function()
	DropPlayer(source, Lang:t("afk.kick_message"))
end)

DynCore.Functions.CreateCallback('dyn-afkkick:server:GetPermissions', function(source, cb)
    cb(DynCore.Functions.GetPermission(source))
end)
