fx_version 'adamant'
game 'gta5'

client_scripts {
    "client/client.lua"
}

server_scripts {
    'config.lua',
    'sv_chat.lua'
}

ui_page "html/index.html"

files {
    "html/index.html",
    "html/style.css",
    "html/img/*.png",
    "html/*.js",
}

lua54 "yes"

escrow_ignore {
    "config.lua"
}