local Utils = exports['gfx-base']:Utils()
local mutedPlayers = {}
local spamProtection = {}

RegisterServerEvent("__chat:messageEntered")
AddEventHandler(
    "__chat:messageEntered",
    function(message, MeOrDo)
        local src = source
        local player = Utils.GetPlayer(source)
        local identifier = Utils.GetIdentifier(player)
        if not player then
            return
        end
        if spamProtection[src] and os.time() - spamProtection[src] < 1 then
            return
        end
        if WordFilter(message) then
            return
        end
        if #message > 120 then
            return
        end
        if
            mutedPlayers[identifier] and
                (os.time() - mutedPlayers[identifier].start < mutedPlayers[identifier].timer)
         then
            TriggerClientEvent(
                "gfx-chat:addMessage",
                src,
                {
                    message = "You have been muted!",
                    type = "alert"
                }
            )
            return
        end
        mutedPlayers[identifier] = mutedPlayers[identifier] ~= nil and nil
        local messageData = {
            id = src,
            src = src,
            type = "message",
            admin = Utils.IsMod(player),
            name = GetPlayerName(src),
            message = message,
        }
        spamProtection[src] = os.time()
        TriggerClientEvent("gfx-chat:addMessage", -1, messageData)
    end
)

RegisterServerEvent("gfx-chat:adminAction")
AddEventHandler(
    "gfx-chat:adminAction",
    function(data)
        local src = source
        local player = Utils.GetPlayer(source)
        if not player then
            return
        end
        if not Utils.IsMod(player) then
            return
        end
        data.id = tonumber(data.id)
        if data.type == "kick" then
            DropPlayer(data.id, "You have been kicked by staff!")
            return
        end
        player = nil
        if data.type == "mute" then
            data.time = tonumber(data.time)
            local player = Utils.GetPlayer(data.muteId)
            if player then
                local identifier = Utils.GetPlayerIdentifier(player)
                mutedPlayers[identifier] = {start = os.time(), timer = data.time * 60}
                TriggerClientEvent(
                    "gfx-chat:addMessage",
                    -1,
                    {
                        message = ("%s has been muted for %s minutes!"):format(
                            GetPlayerName(src),
                            data.time
                        ),
                        type = "alert"
                    }
                )
            end
            return
        end
    end
)

RegisterCommand(
    "announce",
    function(source, args)
        local player = Utils.GetPlayer(source)
        local message = table.concat(args, " ")
        if Utils.IsAdmin(player) then
            TriggerClientEvent(
                "gfx-chat:addMessage",
                -1,
                {
                    message = message,
                    type = "alert"
                }
            )
        end
    end
)

RegisterCommand(
    "mute",
    function(source, args)
        local player = Utils.GetPlayer(source)
        local id = tonumber(args[1])
        local time = tonumber(args[2])
        if id and time then
            local target = Utils.GetPlayerIndex(id)
            if not Utils.IsMod(player) then
                return
            end
            local id = tonumber(args[1])
            if target then
                local identifier = Utils.GetIdentifier(target)
                if mutedPlayers[identifier] == nil then
                    mutedPlayers[identifier] = {start = os.time(), timer = time * 60 * 1000}
                    TriggerClientEvent(
                        "gfx-chat:addMessage",
                        -1,
                        {
                            message = ("%s has been muted for %s minutes!"):format(
                                target.PlayerData.metadata["nickname"],
                                time
                            ),
                            type = "alert"
                        }
                    )
                end
            else
                Utils.Notify(src, "Invalid user id")
            end
        end
    end
)

RegisterCommand(
    "unmute",
    function(source, args)
        local src = source
        local player = Utils.GetPlayer(source)
        if not Utils.IsMod(player) then
            return
        end
        local id = tonumber(args[1])
        if mutedPlayers[id] then
            mutedPlayers[id] = nil
            TriggerClientEvent(
                "gfx-chat:addMessage",
                src,
                {
                    message = ("You have unmuted [%s]!"):format(id),
                    type = "alert"
                }
            )
        end
    end
)

RegisterCommand(
    "clearall",
    function(source)
        local player = Utils.GetPlayer(source)
        if not Utils.IsMod(player) then
            return
        end
        TriggerClientEvent("gfx-chat:clear", -1)
    end
)

Utils.CreateCallback("gfx-chat:getPerm", function(source, cb)
    local player = Utils.GetPlayer(source)
    cb(false)
end)

function WordFilter(text)
    for i = 1, #Config.WordFilter do
        if text:match(Config.WordFilter[i]) then
            return true
        end
    end
    return false
end

Citizen.CreateThread(function()
    while true do
        local minute = os.date("%M", os.time())
        for i = 1, #Config.AutoAnnounce do
            if (minute % Config.AutoAnnounce[i].minutes) == 0.0 then
                TriggerClientEvent(
                "gfx-chat:addMessage",
                -1,
                    {
                        message = Config.AutoAnnounce[i].text,
                        type = "alert"
                    }
                )
            end
        end
        Citizen.Wait(45 * 1000)
    end
end)

RegisterServerEvent("gfx-chat:DiscordLog", function(message, msgType)
    if Config.DiscordLog then
        DiscordLog(source, message, msgType)
    end
end)
