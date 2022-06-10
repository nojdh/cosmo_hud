fx_version 'cerulean'
game 'gta5'

name 'cosmo_hud'
description 'Clean & Simple hud for FiveM inspired by NoPixel 3.0'
author 'lilfraae'
version "1.2.15"

ui_page 'nui/ui.html'

files {
    'nui/css/*',
    'nui/font/*',
    'nui/img/*',
    'nui/sounds/*',
    'nui/js/*',
    'nui/ui.html',
    'stream/*'
}

client_scripts {
    'client/client.lua',
    'client/addons/seatbelt.lua',
    'client/addons/stress.lua',
}

server_scripts {
    'server/server.lua'
}

shared_scripts {
    'init.lua'
}