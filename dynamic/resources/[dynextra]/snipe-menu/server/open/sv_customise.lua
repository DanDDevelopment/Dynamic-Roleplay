QBCore = nil
ESX = nil
invalid = false


if Config.Core == "QBCore" then
    TriggerEvent(Config.Core..':GetObject', function(obj) QBCore = obj end)
    if QBCore == nil then
        QBCore = exports[Config.CoreFolderName]:GetCoreObject()
    end
elseif Config.Core == "ESX" then
    local status, errorMsg = pcall(function() ESX = exports[Config.CoreFolderName]:getSharedObject() end)
    if (ESX == nil) then
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
else
    print("^1[Invalid Core] ^0You have You have not selected the right Config.Core in framework.lua ^0!")
    invalid = true
end

function GetPlayerIdentifiersList(source, type)
    local identifiers = GetPlayerIdentifiers(source)
    for _, identifier in pairs(identifiers) do
        if string.find(identifier, type) then
            return identifier
        end
    end
    return nil
end

function ShowNotification(src, msg, type)
    if Config.Core == "QBCore" then
        TriggerClientEvent(Config.Core..':Notify', src, msg, type)
    elseif Config.Core == "ESX" then
        TriggerClientEvent('esx:showNotification', src, msg)
    end
end

CreateThread(function()
    Wait(2000)
    if Config.Debug then
        local badgerStarted = "^1Not Running^0"
        if GetResourceState("Badger_Discord_API") == "started" then
            badgerStarted = "^2Running^0"
        end
        print('^6-----------------------^0')
        print("^1[Snipe-Menu]^0: ^2Initialised!^0")
        print("^1[Snipe-Menu]^0: ^2Framework:^0 "..Config.Core.."")
        print("^1[Snipe-Menu]^0: ^2Phone Selected:^0 "..Config.Phone.."")
        print("^1[Snipe-Menu]^0: ^2Badger Discord Working:^0 "..badgerStarted.."")
        print("^1[Snipe-Menu]^0: ^2Fuel Script:^0 "..Config.Fuel.."")
        for k, v in pairs(onlineAdmins) do
            print("^1[Snipe-Menu]^0: ^2Admins Online^0 (Player Id:"..k.."): "..GetPlayerName(k).."")
        end
        print('^6-----------------------^0')
    end
end)
