-- if Config.Core.core == 'qb' then
--     QBCore = exports[Config.Core.corename]:GetCoreObject()
-- elseif Config.Core.core == 'esx' then
--     ESX = exports[Config.Core.corename]:getSharedObject()
-- else
--     print('^1For server owner:^7 ^5you need to properly define your framework in^2 ^6Config.Core^3')
-- end

local replacement = {
  ["TITLE"] = "FE_THDR_GTAO",
  ["MAP"] = "PM_SCR_MAP",
  ["GAME"] = "PM_SCR_GAM",
  ["LEAVE"] = "PM_PANE_LEAVE",
  ["QUIT"] = "PM_PANE_QUIT",
  ["INFO"] = "PM_SCR_INF",
  ["STATS"] = "PM_SCR_STA",
  ["SETTINGS"] = "PM_SCR_SET",
  ["GALLERY"] = "PM_SCR_GAL",
  ["KEYBIND"] = "PM_PANE_CFX",
  ["EDITOR"] = "PM_SCR_RPL",
}

---------------------------
------- THREADS -------
---------------------------

Citizen.CreateThread(function()
  SetMapZoomDataLevel(0, 2.75, 0.9, 0.08, 0.0, 0.0)
  SetMapZoomDataLevel(1, 2.8, 0.9, 0.08, 0.0, 0.0)
  SetMapZoomDataLevel(2, 8.0, 0.9, 0.08, 0.0, 0.0)
  SetMapZoomDataLevel(3, 20.0, 0.9, 0.08, 0.0, 0.0)
  SetMapZoomDataLevel(4, 35.0, 0.9, 0.08, 0.0, 0.0)
  SetMapZoomDataLevel(5, 55.0, 0.0, 0.1, 2.0, 1.0)
  SetMapZoomDataLevel(6, 450.0, 0.0, 0.1, 1.0, 1.0)
  SetMapZoomDataLevel(7, 4.5, 0.0, 0.0, 0.0, 0.0)
  SetMapZoomDataLevel(8, 11.0, 0.0, 0.0, 2.0, 3.0)
end)

Citizen.CreateThread(function()
  while true do
    Wait(1000)
    local playerPed = PlayerPedId()
    local currentZoomSetting = IsPedOnFoot(playerPed) and 1100 or nil
    SetRadarZoom(currentZoomSetting or 1100)
  end
end)

CreateThread(function()
  local lastZoomSetting = nil
  while true do
    Wait(1000) -- Increase wait time
    local playerPed = PlayerPedId()
    local currentZoomSetting = IsPedOnFoot(playerPed) and 1100 or nil

    if currentZoomSetting ~= lastZoomSetting then
      SetRadarZoom(currentZoomSetting or 1100)
      lastZoomSetting = currentZoomSetting
    end
  end
end)

CreateThread(function()
  for key, value in pairs(Config.Options.Header) do
    if replacement[key] then
      AddTextEntry(replacement[key], value)
    end
  end

  RequestStreamedTextureDict('xminimap_200_200', true)

  ReplaceHudColourWithRgba(116, Config.Options.RedGreenBlueAlpha.LINE["RED"],
    Config.Options.RedGreenBlueAlpha.LINE["GREEN"], Config.Options.RedGreenBlueAlpha.LINE["BLUE"],
    Config.Options.RedGreenBlueAlpha.LINE["ALPHA"])
  ReplaceHudColourWithRgba(117, Config.Options.RedGreenBlueAlpha.STYLE["RED"],
    Config.Options.RedGreenBlueAlpha.STYLE["GREEN"], Config.Options.RedGreenBlueAlpha.STYLE["BLUE"],
    Config.Options.RedGreenBlueAlpha.STYLE["ALPHA"])
  ReplaceHudColourWithRgba(142, Config.Options.RedGreenBlueAlpha.WAYPOINT["RED"],
    Config.Options.RedGreenBlueAlpha.WAYPOINT["GREEN"], Config.Options.RedGreenBlueAlpha.WAYPOINT["BLUE"],
    Config.Options.RedGreenBlueAlpha.WAYPOINT["ALPHA"])

  while not HasStreamedTextureDictLoaded("xminimap_200_200") do
    Wait(100)
  end

  while true do
    if IsPauseMenuActive() then
      SetScriptGfxDrawBehindPausemenu(true)
      DrawSprite("xminimap_200_200", 'maincolor', 0.5, 0.5, 1.0, 1.0, 0, 255, 255, 255, Config.Options.opacity)
      PushScaleformMovieFunctionParameterBool(true)
      BeginScaleformMovieMethodOnFrontendHeader("SET_HEADING_DETAILS")
      PushScaleformMovieFunctionParameterString(Config.Options.Header['SERVER_NAME'])
      PushScaleformMovieFunctionParameterString(Config.Options.Header['SERVER_TEXT'])
      PushScaleformMovieFunctionParameterString(Config.Options.Header['SERVER_DISCORD'])
      ScaleformMovieMethodAddParamBool(false)
      EndScaleformMovieMethod()
      Wait(3)
    else
      SetStreamedTextureDictAsNoLongerNeeded('xminimap_200_200')
      Wait(150)
    end
  end
end)
---------------------------
------- FUNCTIONS -------
---------------------------

function AddTextEntry(key, value)
  Citizen.InvokeNative(0x32CA01C3, key, value)
end


---------------------------
------- EVENTS -------
---------------------------

-- RegisterNetEvent('abl-minimapsystem:client:showlib', function()
--     lib.showContext('minimaps')
--     QBCore.Functions.Notify('test', 'warning', 2000)
-- end)

---------------------------
------- COMMANDS -------
---------------------------

-- if Config.Options.usecommand == 'yes' then
--   RegisterCommand(Config.UseName.CommandName, function()
--     TriggerEvent('abl-minimapsystem:client:showlib')
--   end)
-- end

---------------------------
------- LIB -------
---------------------------

-- lib.registerContext({
--     id = 'minimaps',
--     title = 'Advanced Minimaps',
--     options = {
--       {
--         title = 'Select A Mini Map Style',
--         readOnly = true,
--         icon = 'magnifying-glass'
--       },
--       {
--         title = 'Default Style', ---------- cyan
--         icon = 'map',
--         iconColor = 'white',
--         iconAnimation = 'fade',
--         image = Config.ImagesLinks.cyansstyle,
--         onSelect = function()
--           CyanMapMode()
--         end,
--       },
--       {
--         title = 'Police Zones', ---------- red
--         icon = 'map',
--         iconColor = 'blue',
--         iconAnimation = 'fade',
--         image = Config.ImagesLinks.redstyle,
--         onSelect = function()
--           RedMapMode()
--         end,
--       },
--     }
--   })
