local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['testwebhook'] = '',
    ['playermoney'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['robbing'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['cuffing'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['drop'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['trunk'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['stash'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['glovebox'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['banking'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['shops'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['dealers'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['storerobbery'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['powerplants'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['death'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['joinleave'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['ooc'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['report'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['me'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['pmelding'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['112'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['bans'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['anticheat'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['weather'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['moneysafes'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['bennys'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['bossmenu'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['robbery'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['casino'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['traphouse'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['911'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['palert'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['house'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
    ['qbjobs'] = 'https://discord.com/api/webhooks/1246272179813748796/e6nSZB68uaV1GLGvTLIIPBtdWBkG6VznZf7C2xj9chb3TF92-P7wBXVXv9BDoLDU3f-6',
}

local colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ['lightgreen'] = 65309,
}

local logQueue = {}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone, imageUrl)
    local postData = {}
    local tag = tagEveryone or false

    if Config.Logging == 'discord' then
        if not Webhooks[name] then
            print('Tried to call a log that isn\'t configured with the name of ' .. name)
            return
        end
        local webHook = Webhooks[name] ~= '' and Webhooks[name] or Webhooks['default']
        local embedData = {
            {
                ['title'] = title,
                ['color'] = colors[color] or colors['default'],
                ['footer'] = {
                    ['text'] = os.date('%c'),
                },
                ['description'] = message,
                ['author'] = {
                    ['name'] = 'QBCore Logs',
                    ['icon_url'] = 'https://raw.githubusercontent.com/GhzGarage/qb-media-kit/main/Display%20Pictures/Logo%20-%20Display%20Picture%20-%20Stylized%20-%20Red.png',
                },
                ['image'] = imageUrl and imageUrl ~= '' and { ['url'] = imageUrl } or nil,
            }
        }

        if not logQueue[name] then logQueue[name] = {} end
        logQueue[name][#logQueue[name] + 1] = { webhook = webHook, data = embedData }

        if #logQueue[name] >= 10 then
            if tag then
                postData = { username = 'QB Logs', content = '@everyone', embeds = {} }
            else
                postData = { username = 'QB Logs', embeds = {} }
            end
            for i = 1, #logQueue[name] do postData.embeds[#postData.embeds + 1] = logQueue[name][i].data[1] end
            PerformHttpRequest(logQueue[name][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
            logQueue[name] = {}
        end
    elseif Config.Logging == 'fivemanage' then
        local FiveManageAPIKey = GetConvar('FIVEMANAGE_LOGS_API_KEY', 'false')
        if FiveManageAPIKey == 'false' then
            print('You need to set the FiveManage API key in your server.cfg')
            return
        end
        local extraData = {
            level = tagEveryone and 'warn' or 'info', -- info, warn, error or debug
            message = title,                          -- any string
            metadata = {                              -- a table or object with any properties you want
                description = message,
                playerId = source,
                playerLicense = GetPlayerIdentifierByType(source, 'license'),
                playerDiscord = GetPlayerIdentifierByType(source, 'discord')
            },
            resource = GetInvokingResource(),
        }
        PerformHttpRequest('https://api.fivemanage.com/api/logs', function(statusCode, response, headers)
            -- Uncomment the following line to enable debugging
            -- print(statusCode, response, json.encode(headers))
        end, 'POST', json.encode(extraData), {
            ['Authorization'] = FiveManageAPIKey,
            ['Content-Type'] = 'application/json',
        })
    end
end)

Citizen.CreateThread(function()
    local timer = 0
    while true do
        Wait(1000)
        timer = timer + 1
        if timer >= 60 then -- If 60 seconds have passed, post the logs
            timer = 0
            for name, queue in pairs(logQueue) do
                if #queue > 0 then
                    local postData = { username = 'QB Logs', embeds = {} }
                    for i = 1, #queue do
                        postData.embeds[#postData.embeds + 1] = queue[i].data[1]
                    end
                    PerformHttpRequest(queue[1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
                    logQueue[name] = {}
                end
            end
        end
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
