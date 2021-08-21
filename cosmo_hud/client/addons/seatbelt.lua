local isUiOpen = false
local speedBuffer = {}
local velBuffer = {}
local SeatbeltON = false
local InVehicle = false

function IsCar(veh)
    local vc = GetVehicleClass(veh)
    return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end

function Fwv(entity)
    local hr = GetEntityHeading(entity) + 90.0
    if hr < 0.0 then 
        hr = 360.0 + hr 
    end
    hr = hr * 0.0174533
    return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local ped = PlayerPedId()
        local car = GetVehiclePedIsIn(ped)

        if car ~= 0 and (InVehicle or IsCar(car)) then
            InVehicle = true
            if isUiOpen == false and not IsPlayerDead(PlayerId()) then
                isUiOpen = true
            end

            if SeatbeltON then 
                DisableControlAction(0, 75, true)  -- Disable exit vehicle when stop
                DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
            end

            speedBuffer[2] = speedBuffer[1]
            speedBuffer[1] = GetEntitySpeed(car)

            if not SeatbeltON and speedBuffer[2] ~= nil and GetEntitySpeedVector(car, true).y > 1.0 and speedBuffer[1] > (Config.Speed / 3.6) and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * 0.255) then
                local co = GetEntityCoords(ped)
                local fw = Fwv(ped)

                SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
                SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)

                Citizen.Wait(1)

                SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
            end

            velBuffer[2] = velBuffer[1]
            velBuffer[1] = GetEntityVelocity(car)

            if IsControlJustReleased(0, Config.Control) and GetLastInputMethod(0) then
                SeatbeltON = not SeatbeltON
                if SeatbeltON then
                    TriggerEvent("cosmo_hud:isSeatbeltOn", SeatbeltON) 

                    Citizen.Wait(1)

                    if Config.Sounds then
                        playSound("buckle", Config.Volume)
                    end

                    isUiOpen = true
                else
                    TriggerEvent("cosmo_hud:isSeatbeltOn", SeatbeltON) 
                    if Config.Sounds then
                        playSound("unbuckle", Config.Volume)
                    end

                    isUiOpen = true
                end
            end
        elseif InVehicle then
            InVehicle = false
            SeatbeltON = false
            TriggerEvent("cosmo_hud:isSeatbeltOn", SeatbeltON)
            speedBuffer[1], speedBuffer[2] = 0.0, 0.0

            if isUiOpen == true and not IsPlayerDead(PlayerId()) then
                isUiOpen = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3500)
        if not SeatbeltON and InVehicle and not IsPauseMenuActive() and Config.LoopSound then
            playSound("seatbelt", Config.Volume)
        end
    end
end)

function playSound(soundFile, soundVolume)
    SendNUIMessage({
        transactionType = 'playSound',
        transactionFile = soundFile,
        transactionVolume = soundVolume
    })
end