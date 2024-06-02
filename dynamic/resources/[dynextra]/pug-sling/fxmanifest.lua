lua54 'yes'
fx_version 'cerulean'
game 'gta5'

author 'Discord: zpug'
description 'pug-sling'
version '2.0.9'

shared_scripts { 
	'config.lua',
    'old-sling/config-old.lua',
}

server_script 'server/main.lua'
client_script {
    'client/main.lua',
    'client/open.lua',
    'old-sling/client-old.lua',
}

file 'json/config-weapons.json'

escrow_ignore {
    'config.lua',
    'client/open.lua',
    'server/main.lua',
    'json/config-weapons.json',

    'old-sling/config-old.lua',
}
dependency '/assetpacks'