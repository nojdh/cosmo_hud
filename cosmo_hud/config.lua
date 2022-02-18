Config = {}

-- TickTime // Time before each execution of the thread
Config.TickTime = 1000

-- Version Checker // Check hud version
Config.CheckVersion = true

-- Radar // Set this flag to true if you'd like to show the radar all the time
Config.ShowRadar = false

-- Set this flag to true if you'd like to show the voice indicator
Config.ShowVoice = true

-- Hides hud while player gameplay camera is not rendering
Config.HideWhileGameplayCameraIsNotRendering = true

--[[ 
    Stress // Set this flag to true if you'd like to show the stress indicator. 
    This option now unlock a series of functions and a server event.
    So if you haven't setup the stress system in basicneeds turn this off!
    Config.MinStressEffect = Set minimum stress before having the effects.
]]
Config.ShowStress = true
Config.MinStressEffect = 50

-- SpeedOmeter // Set this flag to false if you'd like to not show information about speed, fuel & seatbelt
Config.ShowSpeedO = true

--[[
    Fuel // Set this flag to true if you'd like to show the current vehicle fuel.
    To make this flag work you'll need LegacyFuel. Otherwise it will not work & will compromise
    the entire hud causing it to not work.
]]
Config.ShowFuel = true -- set this to true if you want to show fuel (you need LegacyFuel)

-- Stamina // Set this flag to false if you'd like to not show the player stamina indicator.
Config.ShowStamina = true

-- Server ID // Set this flag to false if you'd like to not show the player server ID.
Config.ShowServerID = true

--[[
    #####################################################################################
    #                                                                                   #
    #                                                                                   #
    #                              Seatbelt configuration                               #
    #                                                                                   #
    #                                                                                   #    
    #####################################################################################
]]

-- Sound // Set these flags as you wish
Config.ShowBelt = true -- Set this flag to false if you want to disable seatbelt functionality
Config.Sounds = true -- Set this flag to false if you'd like to disable sound when using seatbelt.
Config.Volume = 0.8 -- Set this flag to a volume between 0.0 and 1.0

-- Control // Set this flag to a key that you like. More informations here: docs.fivem.net/docs/game-references/controls
Config.Control = 305

-- Speed // Set a speed
Config.Speed = 100.0