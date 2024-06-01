fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author "abdel4999"
description '0r - Advanced Minimap System'
version '1.0.0'

this_is_a_map 'yes'

client_scripts {
  'Files/CL.lua'
}

server_scripts {
  'Files/SV.lua'
}

shared_scripts {
  'Shared/config.lua'
, '@ox_lib/init.lua'
}

escrow_ignore {
  "Shared/*.lua"
, "Files/*.lua"
, "Files/*.html"
, "Files/*.css"
, "stream/gfx/*.gfx"
, "stream/ydd/*.ydd"
, "stream/ytd/*.ytd"
}

dependency '/assetpacks'