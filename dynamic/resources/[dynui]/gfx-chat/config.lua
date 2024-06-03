Config = {}

Config.AutoAnnounce = {
}

Config.WordFilter = {
    "fword",
}

Config.DiscordLog = false

function DiscordLog(source, message, msgType)
    exports["gfx-logs"]:dclog(source, msgType, {
        text = message
    })
end