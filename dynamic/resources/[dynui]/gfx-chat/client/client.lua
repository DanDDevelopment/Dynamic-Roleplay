local suggestions = {}
local chatInputActive = false
local mouseActive = false
local isAdmin = false
local Utils = exports['gfx-base']:Utils()

Citizen.CreateThread(function()
  Utils.TriggerCallback("gfx-chat:getPerm", function(isMod)
    isAdmin = isMod
  end)
end)

local function refreshCommands()
  if GetRegisteredCommands then
    local registeredCommands = GetRegisteredCommands()    
    local suggestions = {}    
    for _, command in ipairs(registeredCommands) do
        if IsAceAllowed(('command.%s'):format(command.name)) and command.name ~= 'toggleChat' then
            table.insert(suggestions, {
                name = '/' .. command.name,
                help = ''
            })
        end
    end
    SendNUIMessage({
      type = "suggestions",
      suggestions = suggestions
    })
  end
end

Citizen.CreateThread(function()
    SetTextChatEnabled(false)
    refreshCommands()
end)

RegisterKeyMapping("openchat", "openchat", "keyboard", "T")
RegisterCommand("openchat", function()
  chatInputActive = not chatInputActive
  SetNuiFocus(true, false)
  SendNUIMessage({
    type = "display",
    bool = true,
    isAdmin = isAdmin,
    source = GetPlayerServerId(PlayerId())
  })
end)

RegisterKeyMapping("changechatmode", "openchat", "keyboard", "L")
RegisterCommand("changechatmode", function()
    SendNUIMessage({
        type = "chatMode",
    })
end)

RegisterNUICallback('closeInput', function(data)
  SetNuiFocus(false, false)
  chatInputActive = false
  mouseActive = false
end)

RegisterNUICallback('adminAction', function(data)
  TriggerServerEvent("gfx-chat:adminAction", data)
end)

RegisterNUICallback('getMouse', function(data)
  mouseActive = not mouseActive
  SetNuiFocus(true, mouseActive)
end)

RegisterNUICallback('chatResult', function(data)
  local msgType = "message"
  if data.message:sub(1, 1) == '/' then
    msgType = "command"
    ExecuteCommand(data.message:sub(2))
  else
    TriggerServerEvent('__chat:messageEntered', data.message)
  end
  TriggerServerEvent("gfx-chat:DiscordLog", data.message, msgType)
end)

RegisterNetEvent("gfx-chat:addMessage")
AddEventHandler("gfx-chat:addMessage", function(msg)
  SendNUIMessage({
    type = "add_message",
    msg = msg
  })
end)


RegisterNetEvent("chat:addMessage")
AddEventHandler("chat:addMessage", function(msg)
  SendNUIMessage({
    type = "add_message",
    msg = msg
  })
end)

Citizen.CreateThread(function()
  while true do
    DisableControlAction(0, 243, true)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent("gfx-chat:clear")
AddEventHandler("gfx-chat:clear", function()
  SendNUIMessage({
    type = "clear"
  })
end)

RegisterCommand("clear", function()
  TriggerEvent("gfx-chat:clear")
end)