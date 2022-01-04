Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)

        local pedID = PlayerPedId()
        
        -- Vehicle config while entity inside
        if IsPedInAnyVehicle(pedID, true) then
            SetRadarZoom(1000)
            local veh = GetVehiclePedIsUsing(pedID, false)
            local speed = math.floor(GetEntitySpeed(veh) * 3.6)

            SendNUIMessage({
                speed = speed, 
            })
        end

        -- SpeedO gonfig
        if Config.ShowSpeedO then
            if IsPedInAnyVehicle(pedID, false) 
            and not IsPedInFlyingVehicle(pedID) 
            and not IsPedInAnySub(pedID) then
                SendNUIMessage({showSpeedo = true})
            elseif not IsPedInAnyVehicle(pedID, false) then
                SendNUIMessage({showSpeedo = false})
            end
        end
    end
end)