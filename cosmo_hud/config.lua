Config = {}

-- Resource Name // Don't touch!
Config.resource = GetCurrentResourceName()

-- TickTime // Time before each execution of the thread
Config.ticktime = 1000

-- Version Checker // Check hud version
Config.versioncheck = true

-- Radar // Set this flag to true if you'd like to show the radar all the time
Config.showradar = false

-- Hides hud while player gameplay camera is not rendering
Config.gprendering = true

--[[ 
    Stress // Set this flag to true if you'd like to show the stress indicator. 
    This option now unlock a series of functions and a server event.
    So if you haven't setup the stress system in basicneeds turn this off!
    Config.MinStressEffect = Set minimum stress before having the effects.
]]
Config.showstress = true
Config.minstresseffect = 50

-- SpeedOmeter // Set this flag to false if you'd like to not show information about speed, fuel & seatbelt
Config.showspeedo = true

-- Fuel // Set this flag to true if you'd like to show the current vehicle fuel.
Config.showfuel = false

-- Stamina // Set this flag to false if you'd like to not show the player stamina indicator.
Config.showstamina = true

-- Server ID // Set this flag to false if you'd like to not show the player server ID.
Config.serverid = true

-- Seatbelt configuration
-- Sound // Set these flags as you wish
Config.seatbelt = true -- Set this flag to false if you want to disable seatbelt functionality
Config.sounds = true -- Set this flag to false if you'd like to disable sound when using seatbelt.
Config.volume = 0.8 -- Set this flag to a volume between 0.0 and 1.0

-- Control // Set this flag to a key that you like. More informations here: docs.fivem.net/docs/game-references/controls
Config.beltcontrol = 305

-- Speed // Set a speed
Config.speed = 100.0

-- Additional configuration
-- NPWD // If using the NPWD phone, this option will perform client side restart when using the command
Config.npwd = true

-- ox_inventory // If using the ox_inventory, this will perform a client side restart when using the command
Config.ox_inventory = true
