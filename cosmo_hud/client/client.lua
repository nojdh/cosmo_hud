-- ESX Library
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
end)

-- Principal Event
RegisterNetEvent("cosmo_hud:onTick")
AddEventHandler("cosmo_hud:onTick", function(status)
    local playerPed  = PlayerPedId()

    TriggerEvent('esx_status:getStatus', 'hunger', function(status) 
        hunger = status.val / 10000
    end)
    
    TriggerEvent('esx_status:getStatus', 'thirst', function(status) 
        thirst = status.val / 10000 
    end)
            
    if not Config['ShowStress'] then
        TriggerEvent('esx_status:getStatus', 'stress', function(status) 
            stress = status.val / 10000 
        end)
    end

    if hunger == 0 or thirst == 0 then
        ForcePedMotionState(playerPed, 1110276645, 0, 0, 0)
    end
end)

-- Principal Loop
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config['TickTime'])
        
        -- Player ID
        if (Config['ShowServerID']) then
            SendNUIMessage({
                pid = true,
                playerid = GetPlayerServerId(PlayerId()),
            })
        else
            SendNUIMessage({pid = false})
        end

        -- Show Ped Oxygen underwater
        if IsPedSwimmingUnderWater(PlayerPedId()) then
            SendNUIMessage({showOxygen = true})
        else
            SendNUIMessage({showOxygen = false})
        end

        -- Show Ped Oxygen when sprinting
        if Config['ShowStamina'] then
            if IsPedSprinting(PlayerPedId()) then
                SendNUIMessage({showStamina = true})
            else
                SendNUIMessage({showStamina = false})
            end
        else
            SendNUIMessage({hideStamina = true})
        end
        
        -- Show/Hide Entity Health
        if ((GetEntityHealth(PlayerPedId()) - 100) >= 100) then
            SendNUIMessage({showHealth = false})
        else
            SendNUIMessage({showHealth = true})
        end

        -- Show/Hide SpeedO
        if Config['ShowSpeed'] then
            if IsPedInAnyVehicle(PlayerPedId(), false) 
            and not IsPedInFlyingVehicle(PlayerPedId()) 
            and not IsPedInAnySub(PlayerPedId()) then
                SendNUIMessage({showSpeedo = true})
            elseif not IsPedInAnyVehicle(PlayerPedId(), false) then
                SendNUIMessage({showSpeedo = false})
            end
        end

        -- Show/Hide Stress (needs to be configurated inside esx_basicneeds)
        if not Config['ShowStress'] then
            SendNUIMessage({showStress = false})
        else
            SendNUIMessage({showStress = true})
        end

        -- Checks if pause menu is active
        if IsPauseMenuActive() then
            SendNUIMessage({showUi = false})
        elseif not IsPauseMenuActive() then
            SendNUIMessage({showUi = true})
        end

        -- Show/hide fuel icon
        if Config['ShowFuel'] then
            SendNUIMessage({showFuel = true})
        else
            SendNUIMessage({showFuel = false})
        end

        -- Show/Hide radar
        if not Config['ShowRadar'] then
            if IsPedInAnyVehicle(PlayerPedId(-1), false) then
                DisplayRadar(true)
            else
                DisplayRadar(false)
            end
        else
            DisplayRadar(true)
        end

        -- Vehicle Things
        if IsPedInAnyVehicle(PlayerPedId(), true) then
            SetRadarZoom(1000)
            local veh = GetVehiclePedIsUsing(PlayerPedId(), false)
            local speed = math.floor(GetEntitySpeed(veh) * 3.6)
            local vehhash = GetEntityModel(veh)
            local maxspeed = GetVehicleModelMaxSpeed(vehhash) * 3.6
            SendNUIMessage({speed = speed, maxspeed = maxspeed})
        end

        if Config['ShowFuel'] then
            if IsPedInAnyVehicle(PlayerPedId(), true) then
                local veh = GetVehiclePedIsUsing(PlayerPedId(), false)
                local fuellevel = exports["LegacyFuel"]:GetFuel(veh)
                SendNUIMessage({
                    action = "update_fuel",
                    fuel = fuellevel
                })
            end
        end

        -- Information sent to JavaScript
        SendNUIMessage({
            action = "update_hud",
            hp = GetEntityHealth(PlayerPedId()) - 100,
            armor = GetPedArmour(PlayerPedId()),
            hunger = hunger,
            thirst = thirst,
            stress = stress,
            oxygen = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10,
            stamina = GetPlayerSprintTimeRemaining(PlayerId()) * 10,
        })
    end
end)

-- Map stuff
Citizen.CreateThread(function()
    local posX, posY, width, height = -0.015, -0.015, 0.16, 0.25

    RequestStreamedTextureDict("circlemap", false)
    while not HasStreamedTextureDictLoaded("circlemap") do Wait(100) end
    AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
    
    SetMinimapClipType(1)
    SetMinimapComponentPosition('minimap', 'L', 'B', posX, posY, width, height)
    SetMinimapComponentPosition('minimap_mask', 'L', 'B', posX + 0.17, posY + 0.09, 0.072, 0.162)
    SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.025, 0.022, 0.256, 0.337)

    SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0) -- Level 0
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0) -- Level 1
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0) -- Level 2
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0) -- Level 3
    SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0) -- Level 4

    local minimap = RequestScaleformMovie("minimap")
    SetBigmapActive(true, false)
    Wait(0)
    SetBigmapActive(false, false)
    
    while true do
        Wait(0)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
        SetBlipAlpha(GetNorthRadarBlip(), 0)
    end
end)

-- Microphone
AddEventHandler("SaltyChat_VoiceRangeChanged", function(voiceRange, index, availableVoiceRanges)
    SendNUIMessage({
        action = "voice_level", 
        voicelevel = index
    })
end)

AddEventHandler("SaltyChat_TalkStateChanged", function(isTalking)
    SendNUIMessage({
        talking = isTalking
    })
end)