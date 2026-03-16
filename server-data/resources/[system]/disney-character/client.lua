RegisterNetEvent("disney-character:normalSpawn")
RegisterNetEvent("disney-character:characterCreate")

local cam = nil
local camHeight = 1000
local freezePlayer = true
local spawnState = -1
local hidePlayers = false

local characterData = {}
local characterName = ""
local characterSurname = ""
local characterAge = 0

local isCreating = false

-------------------------------------------------
-- UTIL
-------------------------------------------------

local function fadeOut()
    DoScreenFadeOut(500)
    while IsScreenFadingOut() do Wait(10) end
end

local function fadeIn()
    ShutdownLoadingScreen()
    DoScreenFadeIn(500)
    while IsScreenFadingIn() do Wait(10) end
end

local function getPed()
    return PlayerPedId()
end

-------------------------------------------------
-- CAMERA SYSTEM
-------------------------------------------------

local function createCamera()
    if not DoesCamExist(cam) then
        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
    end
end

function TriggerCamController(state)

    createCamera()

    if state == -1 then
        local coords = GetEntityCoords(getPed())
        SetCamCoord(cam, coords.x, coords.y, 1000.0)
        SetCamRot(cam, -90.0, 0.0, 0.0, 2)
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 0, true, true)

    elseif state == 1 then

        SetCamCoord(cam, 402.6, -997.2, -98.3)
        SetCamRot(cam, 0.0, 0.0, 358.0, 2)
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 0, true, true)

    elseif state == 2 then

        local ped = getPed()
        local pos = GetEntityCoords(ped)

        camHeight = 1000

        while camHeight > 50 do

            if camHeight <= 300 then
                camHeight = camHeight - 6
            elseif camHeight <= 700 then
                camHeight = camHeight - 4
            else
                camHeight = camHeight - 2
            end

            SetCamCoord(cam, pos.x, pos.y, camHeight)

            Wait(10)
        end

    elseif state == -2 then

        SetCamActive(cam, false)
        RenderScriptCams(false, true, 0, true, true)
        SetFocusEntity(getPed())

    end
end

-------------------------------------------------
-- PLAYER FREEZE SYSTEM
-------------------------------------------------

CreateThread(function()

    local ped = getPed()

    SetNuiFocus(false,false)
    SetEntityInvincible(ped,true)
    SetEntityVisible(ped,false)
    FreezeEntityPosition(ped,true)

    while freezePlayer do

        ped = getPed()

        if spawnState == 1 then

            SetEntityVisible(ped,true)
            FreezeEntityPosition(ped,true)

        elseif spawnState == 2 then

            TriggerCamController(2)

            SetEntityInvincible(ped,false)
            FreezeEntityPosition(ped,false)
            SetEntityVisible(ped,true)

            TriggerCamController(-2)

            freezePlayer = false

        else

            SetEntityVisible(ped,false)
            FreezeEntityPosition(ped,true)

        end

        Wait(100)

    end

end)

-------------------------------------------------
-- CHARACTER CREATION
-------------------------------------------------

function startCharacterCreation()

    TriggerCamController(-1)

    fadeOut()

    hidePlayers = true
    isCreating = true

    TriggerCamController(-2)

    changeGender("mp_m_freemode_01")
    setDefaultClothes()

    updateSkin()
    updateFace()
    updateHead()

    SetEntityCoordsNoOffset(getPed(),402.55,-996.37,-99.01,true,true,true)
    SetEntityHeading(getPed(),180.0)

    TriggerCamController(1)

    Wait(2000)

    fadeIn()

    SetNuiFocus(true,true)

    SendNUIMessage({
        CharacterMode = true
    })

end

-------------------------------------------------
-- DEFAULT CLOTHES
-------------------------------------------------

function setDefaultClothes()

    local ped = getPed()

    SetPedDefaultComponentVariation(ped)
    ClearAllPedProps(ped)

    if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then

        SetPedComponentVariation(ped,3,15,0,2)
        SetPedComponentVariation(ped,4,61,0,2)
        SetPedComponentVariation(ped,6,16,0,2)
        SetPedComponentVariation(ped,8,15,0,2)
        SetPedComponentVariation(ped,11,104,0,2)

    else

        SetPedComponentVariation(ped,3,15,0,2)
        SetPedComponentVariation(ped,4,15,0,2)
        SetPedComponentVariation(ped,6,5,0,2)
        SetPedComponentVariation(ped,8,7,0,2)
        SetPedComponentVariation(ped,11,5,0,2)

    end

end

-------------------------------------------------
-- GENDER
-------------------------------------------------

function changeGender(model)

    local hash = GetHashKey(model)

    RequestModel(hash)

    while not HasModelLoaded(hash) do
        Wait(10)
    end

    SetPlayerModel(PlayerId(),hash)

    local ped = getPed()

    SetPedMaxHealth(ped,400)
    SetEntityHealth(ped,400)

    SetModelAsNoLongerNeeded(hash)

end

-------------------------------------------------
-- NETWORK PLAYER HIDE
-------------------------------------------------

CreateThread(function()

    while true do

        if hidePlayers then

            for i=0,256 do

                if NetworkIsPlayerActive(i) and i ~= PlayerId() then
                    NetworkFadeOutEntity(GetPlayerPed(i),false)
                end

            end

            Wait(100)

        else

            Wait(1000)

        end

    end

end)

-------------------------------------------------
-- EVENTS
-------------------------------------------------

AddEventHandler("disney-character:characterCreate",function()

    spawnState = 1

    SetTimeout(1000,function()

        startCharacterCreation()

    end)

end)

AddEventHandler("disney-character:normalSpawn",function(first)

    if first then

        TriggerCamController(-1)

        fadeIn()

        spawnState = 2

        TriggerCamController(2)

    else

        TriggerEvent("vrp:ToogleLoginMenu")

    end

end)

-------------------------------------------------
-- SAVE CHARACTER
-------------------------------------------------

RegisterNUICallback("cDoneSave",function(data,cb)

    fadeOut()

    isCreating = false

    SetNuiFocus(false,false)

    hidePlayers = false

    local ped = getPed()

    SetEntityCoordsNoOffset(ped,-815.28,-135.47,28.18,true,true,true)
    SetEntityHeading(ped,71.68)

    for i=0,256 do
        if NetworkIsPlayerActive(i) then
            NetworkFadeInEntity(GetPlayerPed(i),true)
        end
    end

    TriggerServerEvent(
        "disney-character:finishedCharacter",
        characterName,
        characterSurname,
        characterAge,
        characterData
    )

    fadeIn()

end)