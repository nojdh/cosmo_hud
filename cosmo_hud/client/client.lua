-- ESX Library
ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
end)
-- End Config Library

-- Principal Event
RegisterNetEvent("cosmo_hud:onTick")
AddEventHandler("cosmo_hud:onTick", function(status)
    TriggerEvent('esx_status:getStatus', 'hunger', function(status) 
        hunger = status.val / 10000 
    end)
    
    TriggerEvent('esx_status:getStatus', 'thirst', function(status) 
        thirst = status.val / 10000 
    end)
            
    if (Config['ShowStress']) then
        TriggerEvent('esx_status:getStatus', 'stress', function(status) 
            stress = status.val / 10000 
        end)
    end
end)
-- End Principal Event

-- Principal Loop
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config['TickTime'])

        if IsPedSwimmingUnderWater(PlayerPedId()) then
            SendNUIMessage({showOxygen = true})
        else
            SendNUIMessage({showOxygen = false})
        end
        
        if ((GetEntityHealth(PlayerPedId()) - 100) >= 100) then
            SendNUIMessage({showHealth = false})
        else
            SendNUIMessage({showHealth = true})
        end

        if (hunger >= 25) then
            SendNUIMessage({showHunger = false})
        else
            SendNUIMessage({showHunger = true})
        end

        if (thirst >= 25) then
            SendNUIMessage({showthirst = false})
        else
            SendNUIMessage({showthirst = true})
        end

        if NetworkIsPlayerTalking(PlayerId()) then
            SendNUIMessage({talking = true})
        else
            SendNUIMessage({talking = false})
        end

        if IsPauseMenuActive() then
            SendNUIMessage({showUi = false})
        elseif not IsPauseMenuActive() then
            SendNUIMessage({showUi = true})
        end 

        SendNUIMessage({
            action = "update_hud",
            hp = GetEntityHealth(PlayerPedId()) - 100,
            armor = GetPedArmour(PlayerPedId()),
            hunger = hunger,
            thirst = thirst,
            stress = stress,
            oxygen = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10,
        })
    end
end)
-- End Principal Loop

-- Microphone stuff
function Voicelevel(val)
    SendNUIMessage({
        action = "voice_level", 
        voicelevel = val
    })
end

exports('Voicelevel', Voicelevel)
-- End Microphone stuff

-- Map stuff
local x = -0.025
local y = -0.015
local w = 0.16
local h = 0.25

Citizen.CreateThread(function()
    local minimap = RequestScaleformMovie("minimap")
    RequestStreamedTextureDict("circlemap", false)
    while not HasStreamedTextureDictLoaded("circlemap") do Wait(100) end
    AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap",
                      "radarmasksm")
    
    SetMinimapClipType(1)
    SetMinimapComponentPosition('minimap', 'L', 'B', x, y, w, h)
    SetMinimapComponentPosition('minimap_mask', 'L', 'B', x + 0.17, y + 0.09,
                                0.072, 0.162)
    SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.035, -0.03, 0.18,
                                0.22)
    Wait(5000)
    SetRadarBigmapEnabled(true, false)
    Wait(0)
    SetRadarBigmapEnabled(false, false)

    while true do
        Wait(0)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
        BeginScaleformMovieMethod(minimap, 'HIDE_SATNAV')
        EndScaleformMovieMethod()
    end
end)

CreateThread(function()
    while true do
        Citizen.Wait(Config['TickTime'])
        SetRadarZoom(1150)
        if (Config['ShowRadar']) == false then
            if IsPedInAnyVehicle(PlayerPedId(-1), false) then
                DisplayRadar(true)
            else
                DisplayRadar(false)
            end
        else
            DisplayRadar(true)
        end
        
        if (Config['ShowStress']) == false then
            SendNUIMessage({showStress = false})
        else
            SendNUIMessage({showStress = true})
        end
    end
end)
-- End Map stuff

-- Vehicle Things
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config['TickTime'])

        if IsPedInAnyVehicle(PlayerPedId(), true) then
            local veh = GetVehiclePedIsUsing(PlayerPedId(), false)
            local speed = math.floor(GetEntitySpeed(veh) * 3.6)
            local vehhash = GetEntityModel(veh)
            local maxspeed = GetVehicleModelMaxSpeed(vehhash) * 3.6
            SendNUIMessage({speed = speed, maxspeed = maxspeed})
        end
    end
end)
-- End Vehicle Things

-- SpeedO Things
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config['TickTime'])

        if Config['ShowSpeed'] then
            if IsPedInAnyVehicle(PlayerPedId(), false) 
            and not IsPedInFlyingVehicle(PlayerPedId()) 
            and not IsPedInAnySub(PlayerPedId()) then
                SendNUIMessage({showSpeedo = true})
            elseif not IsPedInAnyVehicle(PlayerPedId(), false) then
                SendNUIMessage({showSpeedo = false})
            end
        end
    end
end)
-- End SpeedO Things