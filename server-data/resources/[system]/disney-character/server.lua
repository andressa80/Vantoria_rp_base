local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")

local userLogin = {}

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    if not first_spawn then return end

    local data = vRP.getUData(user_id,"vRP:spawnController")
    local status = json.decode(data) or 0

    Citizen.Wait(1000)
    processSpawnController(source,status,user_id)
end)

function processSpawnController(source,status,user_id)

    if status == 2 then

        if not userLogin[user_id] then
            userLogin[user_id] = true
            spawnPlayer(source,user_id,false)
        else
            spawnPlayer(source,user_id,true)
        end

    else
        userLogin[user_id] = true
        TriggerClientEvent("disney-character:characterCreate",source)
    end

end


RegisterServerEvent("disney-character:finishedCharacter")
AddEventHandler("disney-character:finishedCharacter",function(nome,sobrenome,idade,characterMode)

    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    vRP.setUData(user_id,"currentCharacterMode",json.encode(characterMode))
    vRP.setUData(user_id,"vRP:spawnController",json.encode(2))

    vRP.execute("vRP/update_user_first_spawn",{
        user_id = user_id,
        firstname = nome,
        name = sobrenome,
        age = idade
    })

    spawnPlayer(source,user_id,true)

end)


function spawnPlayer(source,user_id,firstSpawn)

    TriggerClientEvent("disney-character:normalSpawn",source,firstSpawn)

    TriggerEvent("disney-barbershop:init",user_id)

end