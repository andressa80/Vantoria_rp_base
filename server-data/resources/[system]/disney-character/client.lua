local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

local cam = nil
local spawnState = 0

RegisterNetEvent("disney-character:normalSpawn")
AddEventHandler("disney-character:normalSpawn",function(first)

    DoScreenFadeOut(500)
    Wait(1000)

    local ped = PlayerPedId()

    SetEntityCoords(ped,-1037.72,-2737.86,20.16)

    spawnState = 2

    DoScreenFadeIn(1000)

end)

function TriggerCamController(state)

    if state == 1 then

        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
        SetCamCoord(cam,coords.x,coords.y,coords.z+1.5)
        SetCamRot(cam,0.0,0.0,180.0,2)

        RenderScriptCams(true,true,500,true,true)

    elseif state == -2 then

        if cam then
            SetCamActive(cam,false)
            RenderScriptCams(false,true,500,true,true)
            DestroyCam(cam,false)
            cam = nil
        end

    end
end