-- Define a versão do FXServer (recomendado usar 'cerulean' que é mais atual)
fx_version 'cerulean'

-- Define o jogo (GTA V)
game 'gta5'

-- Informações do resource (opcional, mas profissional)
author 'Andressa'
description 'Sistema geral: radar, recoil, dispatch, helicam, peds e HUD'
version '1.0.0'

-- SCRIPTS CLIENT (rodam no jogador)
client_scripts {

    -- 📡 Radar personalizado (velocímetro, HUD de carro, etc)
    'client/radar.lua',

    -- 🔫 Sistema de recoil (recúo da arma mais realista)
    'client/recoil.lua',

    -- 🌐 Carregamento de IP / proteção / identificação (depende do seu script)
    'client/iploader.lua',

    -- 🚁 Câmera de helicóptero (zoom, visão térmica, etc)
    'client/helicam.lua',

    -- 🚔 Sistema de dispatch (remove polícia NPC, controle de ocorrências)
    'client/dispatch.lua',

    -- 👮 NPCs de profissões (peds espalhados pelo mapa)
    'client/peds_profissoes.lua',

    -- 🖥️ Remove HUD padrão do GTA (vida, dinheiro, etc)
    'client/removehud.lua',

    -- 💡 Sistema de luzes custom (hospital, polícia, etc)
    'client/luzes.lua'
}