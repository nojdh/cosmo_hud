local inVehicle = false
local isSwimming = false
local speedLimits = {["Joshua Rd"]=25, ["East Joshua Road"]=25, ["Marina Dr"]=19.45, ["Alhambra Dr"]=19.45, ["Niland Ave"]=19.45, ["Zancudo Ave"]=19.45, ["Armadillo Ave"]=19.45, ["Algonquin Blvd"]=19.45, ["Mountain View Dr"]=19.45, ["Cholla Springs Ave"]=19.45, ["Panorama Dr"]=19.45, ["Lesbos Ln"]=19.45, ["Calafia Rd"]=19.45, ["North Calafia Way"]=19.45, ["Cassidy Trail"]=19.45, ["Seaview Rd"]=19.45, ["Grapeseed Main St"]=19.45, ["Grapeseed Ave"]=19.45, ["Joad Ln"]=19.45, ["Union Rd"]=19.45, ["O'Neil Way"]=19.45, ["Senora Fwy"]=33.35, ["Catfish View"]=19.45, ["Great Ocean Hwy"]=19.45, ["Paleto Blvd"]=19.45, ["Duluoz Ave"]=19.45, ["Procopio Dr"]=19.45, ["Cascabel Ave"]=19.45, ["Procopio Promenade"]=19.45, ["Pyrite Ave"]=19.45, ["Fort Zancudo Approach Rd"]=19.45, ["Barbareno Rd"]=19.45, ["Ineseno Road"]=19.45, ["West Eclipse Blvd"]=19.45, ["Playa Vista"]=19.45, ["Bay City Ave"]=19.45, ["Del Perro Fwy"]=33.35, ["Equality Way"]=19.45, ["Red Desert Ave"]=19.45, ["Magellan Ave"]=19.45, ["Sandcastle Way"]=19.45, ["Vespucci Blvd"]=19.45, ["Prosperity St"]=19.45, ["San Andreas Ave"]=19.45, ["North Rockford Dr"]=19.45, ["South Rockford Dr"]=19.45, ["Marathon Ave"]=19.45, ["Boulevard Del Perro"]=19.45, ["Cougar Ave"]=19.45, ["Liberty St"]=19.45, ["Bay City Incline"]=19.45, ["Conquistador St"]=19.45, ["Cortes St"]=19.45, ["Vitus St"]=19.45, ["Aguja St"]=19.45, ["Goma St"]=19.45, ["Melanoma St"]=19.45, ["Palomino Ave"]=19.45, ["Invention Ct"]=19.45, ["Imagination Ct"]=19.45, ["Rub St"]=19.45, ["Tug St"]=19.45, ["Ginger St"]=19.45, ["Lindsay Circus"]=19.45, ["Calais Ave"]=19.45, ["Adam's Apple Blvd"]=19.45, ["Alta St"]=19.45, ["Integrity Way"]=19.45, ["Swiss St"]=19.45, ["Strawberry Ave"]=19.45, ["Capital Blvd"]=19.45, ["Crusade Rd"]=19.45, ["Innocence Blvd"]=19.45, ["Davis Ave"]=19.45, ["Little Bighorn Ave"]=19.45, ["Roy Lowenstein Blvd"]=19.45, ["Jamestown St"]=19.45, ["Carson Ave"]=45, ["Grove St"]=19.45, ["Brouge Ave"]=19.45, ["Covenant Ave"]=19.45, ["Dutch London St"]=19.45, ["Signal St"]=19.45, ["Elysian Fields Fwy"]=33.35, ["Plaice Pl"]=19.45, ["Chum St"]=19.45, ["Chupacabra St"]=19.45, ["Miriam Turner Overpass"]=19.45, ["Autopia Pkwy"]=19.45, ["Exceptionalists Way"]=19.45, ["La Puerta Fwy"]=33.35, ["New Empire Way"]=19.45, ["Runway1"]=13.5, ["Greenwich Pkwy"]=19.45, ["Kortz Dr"]=19.45, ["Banham Canyon Dr"]=19.45, ["Buen Vino Rd"]=19.45, ["Route 68"]=33.35, ["Zancudo Grande Valley"]=19.45, ["Zancudo Barranca"]=19.45, ["Galileo Rd"]=19.45, ["Mt Vinewood Dr"]=19.45, ["Marlowe Dr"]=19.45, ["Milton Rd"]=19.45, ["Kimble Hill Dr"]=19.45, ["Normandy Dr"]=19.45, ["Hillcrest Ave"]=19.45, ["Hillcrest Ridge Access Rd"]=19.45, ["North Sheldon Ave"]=19.45, ["Lake Vinewood Dr"]=19.45, ["Lake Vinewood Est"]=19.45, ["Baytree Canyon Rd"]=19.45, ["Peaceful St"]=19.45, ["North Conker Ave"]=19.45, ["Wild Oats Dr"]=19.45, ["Whispymound Dr"]=19.45, ["Didion Dr"]=19.45, ["Cox Way"]=19.45, ["Picture Perfect Drive"]=19.45, ["South Mo Milton Dr"]=19.45, ["Cockingend Dr"]=19.45, ["Mad Wayne Thunder Dr"]=19.45, ["Hangman Ave"]=19.45, ["Dunstable Ln"]=19.45, ["Dunstable Dr"]=19.45, ["Greenwich Way"]=19.45, ["Greenwich Pl"]=19.45, ["Hardy Way"]=19.45, ["Richman St"]=19.45, ["Ace Jones Dr"]=19.45, ["Los Santos Freeway"]=33.35, ["Senora Rd"]=19.45, ["Nowhere Rd"]=35, ["Smoke Tree Rd"]=19.45, ["Cholla Rd"]=19.45, ["Cat-Claw Ave"]=19.45, ["Senora Way"]=19.45, ["Palomino Fwy"]=33.35, ["Shank St"]=19.45, ["Macdonald St"]=19.45, ["Route 68 Approach"]=33.35, ["Vinewood Park Dr"]=19.45, ["Vinewood Blvd"]=19.45, ["Mirror Park Blvd"]=19.45, ["Glory Way"]=19.45, ["Bridge St"]=19.45, ["West Mirror Drive"]=19.45, ["Nikola Ave"]=19.45, ["East Mirror Dr"]=19.45, ["Nikola Pl"]=35, ["Mirror Pl"]=19.45, ["El Rancho Blvd"]=19.45, ["Olympic Fwy"]=33.35, ["Fudge Ln"]=19.45, ["Amarillo Vista"]=19.45, ["Labor Pl"]=19.45, ["El Burro Blvd"]=19.45, ["Sustancia Rd"]=55, ["South Shambles St"]=19.45, ["Hanger Way"]=19.45, ["Orchardville Ave"]=19.45, ["Popular St"]=19.45, ["Buccaneer Way"]=55, ["Abattoir Ave"]=19.45, ["Voodoo Place"]=40, ["Mutiny Rd"]=19.45, ["South Arsenal St"]=19.45, ["Forum Dr"]=19.45, ["Morningwood Blvd"]=19.45, ["Dorset Dr"]=19.45, ["Caesars Place"]=19.45, ["Spanish Ave"]=19.45, ["Portola Dr"]=19.45, ["Edwood Way"]=19.45, ["San Vitus Blvd"]=19.45, ["Eclipse Blvd"]=19.45, ["Gentry Lane"]=40, ["Las Lagunas Blvd"]=19.45, ["Power St"]=19.45, ["Mt Haan Rd"]=19.45, ["Elgin Ave"]=19.45, ["Hawick Ave"]=19.45, ["Meteor St"]=19.45, ["Alta Pl"]=19.45, ["Occupation Ave"]=19.45, ["Carcer Way"]=19.45, ["Eastbourne Way"]=19.45, ["Rockford Dr"]=19.45, ["Abe Milton Pkwy"]=19.45, ["Laguna Pl"]=19.45, ["Sinners Passage"]=19.45, ["Atlee St"]=19.45, ["Sinner St"]=19.45, ["Supply St"]=19.45, ["Amarillo Way"]=19.45, ["Tower Way"]=19.45, ["Decker St"]=19.45, ["Tackle St"]=19.45, ["Low Power St"]=19.45, ["Clinton Ave"]=19.45, ["Fenwell Pl"]=19.45, ["Utopia Gardens"]=19.45, ["Cavalry Blvd"]=19.45, ["South Boulevard Del Perro"]=19.45, ["Americano Way"]=19.45, ["Sam Austin Dr"]=19.45, ["East Galileo Ave"]=19.45, ["Galileo Park"]=19.45, ["West Galileo Ave"]=19.45, ["Tongva Dr"]=19.45, ["Zancudo Rd"]=19.45, ["Movie Star Way"]=19.45, ["Heritage Way"]=19.45, ["Perth St"]=19.45, ["Chianski Passage"]=19.45, ["Lolita Ave"]=19.45, ["Meringue Ln"]=19.45, ["Strangeways Dr"]=19.45}
local speedLimit = 0
local minimap = RequestScaleformMovie("minimap")

Citizen.CreateThread(function()
	if Config.UnitOfSpeed == "kmh" then
		SpeedMultiplier = 3.6
		for k,v in pairs(speedLimits) do
			k = v * SpeedMultiplier
		end
	elseif Config.UnitOfSpeed == "mph" then
		SpeedMultiplier = 2.236936
		for k,v in pairs(speedLimits) do
			k = v * SpeedMultiplier
		end
	end
	ESX = exports['es_extended']:getSharedObject()
	playerPed = PlayerPedId()
end)

ToggleRadar = function(state)
	DisplayRadar(state)
	BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
	ScaleformMovieMethodAddParamInt(3)
	EndScaleformMovieMethod()
end

TriggerVehicleLoop = function()
	Citizen.CreateThread(function()
		ToggleRadar(true)
		veh = GetVehiclePedIsUsing(playerPed, false)
		local vehhash = GetEntityModel(veh)
		local maxspeed = (GetVehicleModelMaxSpeed(vehhash) * SpeedMultiplier)
		if not IsPedInFlyingVehicle(playerPed) and not IsPedInAnySub(playerPed) then
			SendNUIMessage({showSpeedo = true})
		else
			SendNUIMessage({showSpeedo = false})
		end
		while inVehicle do
			Wait(100)
			local speed = math.floor(GetEntitySpeed(veh) * SpeedMultiplier)
			SendNUIMessage({speed = speed, maxspeed = maxspeed})
		end
		if not Config.AlwaysShowRadar then
			ToggleRadar(false)
		end
		SendNUIMessage({showSpeedo = false})
	end)
end

local hasSpawned = false
AddEventHandler('playerSpawned', function()
	if not hasSpawned then
		hasSpawned = true
		for i=1, 550 do
			HideHudAndRadarThisFrame()
			Wait(1)
		end
		SendNUIMessage({showUi = true})
	end
end)

RegisterNetEvent('esx:onPlayerLogout', function()
	hasSpawned = false
	SendNUIMessage({showUi = false})
end)

AddEventHandler('esx_status:onTick', function(data)
	playerPed = PlayerPedId()
	local playerId = PlayerId()
	local isTalking = NetworkIsPlayerTalking(playerId)
	if IsPedSwimming(playerPed) then
		isSwimming = true
		SendNUIMessage({showOxygen = true})
	else
		isSwimming = false
		SendNUIMessage({showOxygen = false})
	end

	if Config.ShowSpeedo then
		if not inVehicle and IsPedInAnyVehicle(playerPed, true) then
			inVehicle = true
			TriggerVehicleLoop()
		elseif inVehicle and not IsPedInAnyVehicle(playerPed, true) then
			inVehicle = false
		end
	end

	local hunger, thirst, stress
	for k, v in pairs(data) do
		if v.name == 'hunger' then hunger = v.percent
		elseif v.name == 'thirst' then thirst = v.percent
		elseif v.name == 'stress' then stress = v.percent
		end
	end

	SendNUIMessage({
		action = "update_hud",
		hp = (GetEntityHealth(playerPed) * 100) / (GetEntityMaxHealth(playerPed)),
		armor = GetPedArmour(playerPed),
		hunger = hunger,
		thirst = thirst,
		stress = stress,
		oxygen = GetPlayerUnderwaterTimeRemaining(playerId) * 10,
		talking = isTalking
	})
end)

AddEventHandler('pma-voice:setTalkingMode', function(mode)
	SendNUIMessage({action = "voice_level", voicelevel = mode})
end)

AddEventHandler('pma-voice:setTalkingOnRadio', function(radioStatus)
	SendNUIMessage({radio = radioStatus})
end)

Citizen.CreateThread(function()
	local x = -0.025
	local y = -0.015
	local w = 0.16
	local h = 0.25
	while not HasScaleformMovieLoaded(minimap) do
		Wait(0)
	end
	RequestStreamedTextureDict("circlemap", false)
	while not HasStreamedTextureDictLoaded("circlemap") do Wait(100) end
	AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
	SetMinimapClipType(1)
	SetRadarBigmapEnabled(true, false)
	Wait(3000)
	SetRadarBigmapEnabled(false, false)
	SetMinimapComponentPosition('minimap', 'L', 'B', x, y, w, h)
	SetMinimapComponentPosition('minimap_mask', 'L', 'B', x + 0.17, y + 0.09, 0.072, 0.162)
	SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.035, -0.03, 0.18, 0.22)
	if ESX.IsPlayerLoaded() then
		hasSpawned = true
		ToggleRadar(Config.AlwaysShowRadar)
		SendNUIMessage({showUi = true})
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(5)
		SetRadarAsExteriorThisFrame()
		if inVehicle then
			BeginScaleformMovieMethod(minimap, 'HIDE_SATNAV')
			EndScaleformMovieMethod()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(2000)
		if inVehicle == false and Config.AlwaysShowRadar == false then
			ToggleRadar(false)
		else
			SetRadarZoom(1150)
			ToggleRadar(true)
		end
		if Config.ShowStress == false then
			SendNUIMessage({action = "disable_stress"})
		end

		if Config.ShowVoice == false then
			SendNUIMessage({action = "disable_voice"})
		end

		if Config.ShowFuel == true then
            if inVehicle and IsPedInAnyVehicle(PlayerPedId(), true) then
                local veh = GetVehiclePedIsUsing(PlayerPedId(), false)
                local fuellevel = GetVehicleFuelLevel(veh)
                SendNUIMessage({
                    action = "update_fuel",
                    fuel = fuellevel,
                    showFuel = true
                })
            end
        elseif Config.ShowFuel == false then
            SendNUIMessage({showFuel = false})
        end
	end
end)

RegisterCommand("togglehud", function()
	SendNUIMessage({action = "toggle_hud"})
end)
