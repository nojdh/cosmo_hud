Config = {}

-- TickTime // Time before each execution of the thread
Config.TickTime = 1000

-- Radar // Set this flag to true if you'd like to show the radar all the time
Config.ShowRadar = false

--[[ 
    Stress // Set this flag to true if you'd like to show the stress indicator. 
    This option now unlock a series of functions and a server event.
    So if you haven't setup the stress system in basicneeds turn this off!
]]
Config.ShowStress = true

-- SpeedOmeter // Set this flag to false if you'd like to not show information about speed, fuel & seatbelt
Config.ShowSpeedO = true

--[[
    Fuel // Set this flag to true if you'd like to show the current vehicle fuel.
    To make this flag work you'll need LegacyFuel. Otherwise it will not work & will compromise
    the entire hud causing it to not work.
]]
Config.ShowFuel = false -- set this to true if you want to show fuel (you need LegacyFuel)

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
Config.Sounds = true -- Set this flag to false if you'd like to disable sound when using seatbelt.
Config.LoopSound = false
Config.Volume = 0.8 -- Set this flag to a volume between 0.0 and 1.0

-- Control // Set this flag to a key that you like. More informations here: docs.fivem.net/docs/game-references/controls
Config.Control = 305

-- Speed // Set a speed
Config.Speed = 100.0

-- Alarm // Set if the alarm should be based on the speed and at which speed the alarm starts.
Config.AlarmOnlySpeed = true
Config.AlarmSpeed = 20