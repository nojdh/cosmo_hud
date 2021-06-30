fx_version 'cerulean'
game 'gta5'

name 'cosmo_hud'
description 'cosmo_hud for fivem, uses library from loading.io'
author 'CosmoKramer | lilfraae'
version "1.2"

ui_page 'html/ui.html'

files {
    'html/ui.html',
    'html/script.js',
    'html/loading-bar.js',
    'html/style.css',
    'stream/*',
}

shared_scripts {
    'config/config.lua'
}

client_scripts {
    'client/client.lua',
}
