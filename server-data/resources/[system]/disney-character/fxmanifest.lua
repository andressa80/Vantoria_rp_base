fx_version 'cerulean'
game 'gta5'

author 'Disney Character System'
description 'Character Creator'
version '1.0.0'

ui_page 'character-nui/index.html'

files {
    'character-nui/index.html',
    'character-nui/style.css',
    'character-nui/vue.js',
    'character-nui/range.png'
}

shared_scripts {
    '@vrp/lib/utils.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}