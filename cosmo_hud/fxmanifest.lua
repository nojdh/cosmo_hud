fx_version 'cerulean'
game 'gta5'

name 'cosmo_hud'
description 'Clean & Simple hud for FiveM inspired by NoPixel 3.0'
author 'lilfraae'
version "1.9"

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
    'client/cl_script.lua',
    'client/addons/seatbelt.lua',
    'client/addons/stress.lua'
}

server_scripts {
    'server/sv_script.lua'
}

shared_scripts {
    'config.lua'
}