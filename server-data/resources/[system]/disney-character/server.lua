local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

RegisterServerEvent("disney-character:createCharacter")
AddEventHandler("disney-character:createCharacter",function(nome,sobrenome,idade)

    local source = source
    local user_id = vRP.getUserId(source)

    if not user_id then return end
    if not nome or not sobrenome or not idade then return end
    if nome == "" or sobrenome == "" then return end

    idade = tonumber(idade)
    if not idade then return end
    if idade < 18 or idade > 90 then return end

    vRP.execute("vRP/update_user_first_spawn",{
        user_id = user_id,
        firstname = nome,
        name = sobrenome,
        age = idade
    })

    spawnPlayer(source,user_id,false)

end)

function spawnPlayer(source,user_id,firstSpawn)

    local ped = GetPlayerPed(source)

    if ped and ped ~= 0 then
        SetEntityCoords(ped,-1037.72,-2737.86,20.16)
        SetEntityHeading(ped,0.0)
    end

    TriggerClientEvent("disney-character:normalSpawn",source,firstSpawn)

end

RegisterCommand("resetchar", function(source,args,rawCommand)

    local user_id = vRP.getUserId(source)
    if not user_id then return end

    -- volta first spawn
    vRP.execute("vRP/set_first_spawn",{
        user_id = user_id
    })

    TriggerClientEvent("Notify",source,"sucesso","Personagem resetado, reconecte no servidor.")

end)