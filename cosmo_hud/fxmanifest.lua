fx_version 'cerulean'
game 'gta5'

name 'cosmo_hud'
description 'cosmo_hud for fivem, uses library from loading.io'
author 'lilfraae'
version "1.5"

ui_page 'nui/ui.html'

files {
    'nui/css/*',
    'nui/img/*',
    'nui/sounds/*',
    'nui/js/*',
    'nui/ui.html',
    'stream/*'
}

client_scripts {
    'client/cl_script.lua',
    'client/addons/seatbelt.lua'
}

server_scripts {
    'server/sv_script.lua'
}

shared_scripts {
    'config.lua'
}