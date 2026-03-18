Citizen.CreateThread(function()
    while true do
        local idle = 1000
        local ped = PlayerPedId()

        -- DESABILITAR DISPATCH (executa só uma vez)
        if not dispatchDisabled then
            for i = 1,120 do
                EnableDispatchService(i,false)
            endlocal bunnyhop = 0
local tasertime = false
local hurt = false
local dispatchDisabled = false

Citizen.CreateThread(function()
    while true do
        local idle = 1000
        local ped = PlayerPedId()

        -- DISPATCH (1x só)
        if not dispatchDisabled then
            for i = 1,120 do
                EnableDispatchService(i,false)
            end
            dispatchDisabled = true
        end

        -- VEÍCULO
        if IsPedInAnyVehicle(ped) then
            local vehicle = GetVehiclePedIsIn(ped)
            local speed = GetEntitySpeed(vehicle)*2.236936

            -- MOTO (tirar X)
            if GetVehicleClass(vehicle) == 8 and GetPedInVehicleSeat(vehicle,0) == ped then
                DisableControlAction(0,73,true)
                idle = 5
            end

            -- DRIVE BY
            if GetPedInVehicleSeat(vehicle,-1) == ped then
                SetPlayerCanDoDriveBy(PlayerId(), speed < 40)
            end

            -- VEÍCULO NO AR
            if IsEntityInAir(vehicle) then
                DisableControlAction(0,59,true)
                DisableControlAction(0,60,true)
                idle = 5
            end

            -- ESTOURAR PNEU
            if speed >= 180 and math.random(1000) >= 995 then
                if GetVehicleTyresCanBurst(vehicle) then
                    local wheel = math.random(0, GetVehicleNumberOfWheels(vehicle)-1)
                    SetVehicleTyreBurst(vehicle,wheel,false,1000.0)
                end
            end

            -- DRIFT
            if GetPedInVehicleSeat(vehicle,-1) == ped and speed <= 100 then
                if IsControlPressed(1,21) then
                    SetVehicleReduceGrip(vehicle,true)
                else
                    SetVehicleReduceGrip(vehicle,false)
                end
            end
        end

        -- CORONHADA
        if IsPedArmed(ped,6) then
            DisableControlAction(0,140,true)
            DisableControlAction(0,141,true)
            DisableControlAction(0,142,true)
            idle = 5
        end

        -- TASER
        if IsPedBeingStunned(ped) then
            SetPedToRagdoll(ped,10000,10000,0,0,0,0)

            if not tasertime then
                tasertime = true
                SetTimecycleModifier("REDMIST_blend")
                ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE",1.0)
            end
        elseif tasertime then
            tasertime = false
            SetTimecycleModifier("")
            StopGameplayCamShaking()
        end

        -- DANO / ANDAR MACHUCADO
        if GetEntityHealth(ped) <= 199 and not IsEntityInWater(ped) then
            if not hurt then
                hurt = true
                RequestAnimSet("move_m@injured")
                SetPedMovementClipset(ped,"move_m@injured",true)
                SetPlayerHealthRechargeMultiplier(PlayerId(),0.0)
            end
            idle = 5
        elseif hurt then
            hurt = false
            ResetPedMovementClipset(ped)
        end

        -- BUNNYHOP
        if IsPedJumping(ped) and bunnyhop <= 0 then
            bunnyhop = 5
        end
        if bunnyhop > 0 then
            DisableControlAction(0,22,true)
        end

        Citizen.Wait(idle)
    end
end)

-- REDUZ COOLDOWN BUNNYHOP
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        if bunnyhop > 0 then
            bunnyhop = bunnyhop - 5
        end
    end
end)
            dispatchDisabled = true
        end

        -- VEÍCULO
        if IsPedInAnyVehicle(ped) then
            local vehicle = GetVehiclePedIsIn(ped)

            -- MOTO (tirar X)
            if GetVehicleClass(vehicle) == 8 and GetPedInVehicleSeat(vehicle,0) == ped then
                DisableControlAction(0,73,true)
                idle = 5
            end

            -- DRIVE BY
            if GetPedInVehicleSeat(vehicle,-1) == ped then
                local speed = GetEntitySpeed(vehicle)*2.236936
                SetPlayerCanDoDriveBy(PlayerId(), speed < 40)
            end

            -- VEÍCULO NO AR
            if IsEntityInAir(vehicle) then
                DisableControlAction(0,59,true)
                DisableControlAction(0,60,true)
                idle = 5
            end
        end

        -- CORONHADA
        if IsPedArmed(ped,6) then
            DisableControlAction(0,140,true)
            DisableControlAction(0,141,true)
            DisableControlAction(0,142,true)
            idle = 5
        end

        -- DANO / ANDAR MACHUCADO
        if GetEntityHealth(ped) <= 199 and not IsEntityInWater(ped) then
            RequestAnimSet("move_m@injured")
            SetPedMovementClipset(ped,"move_m@injured",true)
            SetPlayerHealthRechargeMultiplier(PlayerId(),0.0)
            idle = 5
        else
            ResetPedMovementClipset(ped)
        end

        Citizen.Wait(idle)
    end
end)