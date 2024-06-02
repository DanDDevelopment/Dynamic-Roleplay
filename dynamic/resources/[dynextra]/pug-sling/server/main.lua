
if not Config.UseOldSlingScript then
    Config.FrameworkFunctions.CreateCallback('Pug:server:GetWeaponConfig', function(source, cb)
        local File = LoadResourceFile(GetCurrentResourceName(), "./json/config-weapons.json")
        cb(File)
    end)

    RegisterNetEvent("Pug:server:SaveWeaponFile", function(JsonWeapons, Personal)
        local src = source
        if Personal then
            local Player = FWork.Functions.GetPlayer(src)
            if Player ~= nil then
                Player.Functions.SetMetaData("pug-weapondata", JsonWeapons)
                Player.Functions.Save()
            end
        else
            local JsonWeapon = json.encode(JsonWeapons)
            SaveResourceFile(GetCurrentResourceName(), "./json/config-weapons.json", JsonWeapon)
            TriggerClientEvent("Pug:client:RegisterAllBackWeapons", -1, JsonWeapon)
        end
    end)


    ---------- [OX_INVENTORY RACK STASH SUPPORT] ----------
    local StashCreated = {}
    RegisterNetEvent("Pug:server:SlingOpenOxInvRack", function(StashName, Slots, Space)
        if not StashCreated[StashName] then
            StashCreated[StashName] = true
            exports.ox_inventory:RegisterStash(
                StashName, 
                StashName, 
                Slots, 
                Space
            )
        end
    end)
    ------------------------------


    ---------- [Commands] ----------
    if Framework == "DynCore" then
        FWork.Commands.Add(Config.WeaponSettingCommand, "Adjust server weapons positions", {}, false, function(source, args)
            local src = source
            TriggerClientEvent("Pug:client:OpenSlingEditor",src)
        end,"admin")
        FWork.Commands.Add(Config.PersonalWeponSettingsCommand, "Adjust personal weapons positions", {}, false, function(source, args)
            local src = source
            TriggerClientEvent("Pug:client:OpenSlingEditor",src, true)
        end)
    else
        FWork.RegisterCommand(Config.WeaponSettingCommand, 'admin', function(xPlayer, args)
            local src = xPlayer.source
            TriggerClientEvent("Pug:client:OpenSlingEditor",src)
        end, true, {help = 'Create business menu', validate = true, arguments = {} })
        FWork.RegisterCommand(Config.PersonalWeponSettingsCommand, 'admin', function(xPlayer, args)
            local src = xPlayer.source
            TriggerClientEvent("Pug:client:OpenSlingEditor",src, true)
        end, true, {help = 'Create business menu', validate = true, arguments = {} })
    end
    ------------------------------
end