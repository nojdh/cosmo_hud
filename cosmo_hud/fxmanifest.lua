fx_version 'cerulean'
game 'gta5'

name 'cosmo_hud'
description 'cosmo_hud for fivem, uses library from loading.io'
author 'lilfraae'
version "1.5"

ui_page 'nui/ui.html'

files {
    'nui/ui.html',
    'nui/belt.png',
    'nui/o2.png',
    'nui/script.js',
    'nui/loading-bar.js',
    'nui/style.css',
    'stream/*'
}

client_scripts {
    'client/cl_script.lua'
}

server_scripts {
    'server/sv_script.lua'
}

shared_scripts {
    'config.lua'
}