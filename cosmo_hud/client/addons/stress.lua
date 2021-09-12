Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.TickTime)
        if Config.ShowStress then
            local pedID = PlayerPedId()
            -- If ped vehicle speed is higher than 200 km/h it adds a random stress amount between 500 and 2500
            if IsPedInAnyVehicle(pedID, true) then
                local veh = GetVehiclePedIsUsing(pedID, false)
                local speed = math.floor(GetEntitySpeed(veh) * 3.6)

                if speed >= 220 then
                    TriggerServerEvent('cosmo_hud:gainStress', 250)
                end
            end

            -- If ped is holding a pistol adds a random stress amount between 500 and 1000
            if IsPedArmed(pedID, 4) then
                TriggerServerEvent('cosmo_hud:gainStress', 150)
            end
        end  
    end
end)