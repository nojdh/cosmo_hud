ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

-- Version check function
Citizen.CreateThread(function()
    updatePath = "/xxpromw3mtxx/cosmo_hud"
    resourceName = "cosmo_hud ("..GetCurrentResourceName()..")"
    
    function checkVersion(err,responseText, headers)    
        if Config.Version ~= responseText and tonumber(Config.Version) < tonumber(responseText) then
            print("\n###############################")
            print("\n"..resourceName.." is outdated, should be:\n"..responseText.."is:\n"..Config.Version.."\nplease update it from https://github.com"..updatePath.."/releases")
            print("\n###############################")
        elseif tonumber(Config.Version) > tonumber(responseText) then
            print("You somehow skipped a few versions of "..resourceName.." or the git went offline, if it's still online i advise you to update ( or downgrade? )")
        else
            print("^2"..resourceName.." is up to date!^0")
        end
    end
    
    PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/main/version", checkVersion, "GET")
end)

-- Stress related option
if Config.ShowStress then
    RegisterServerEvent('cosmo_hud:gainStress')
    AddEventHandler('cosmo_hud:gainStress', function(StressAmount)
        local xPlayer = ESX.GetPlayerFromId(source)
        
        if xPlayer ~= nil then
            TriggerClientEvent('esx_status:add', source, 'stress', StressAmount)
            
            TriggerClientEvent("cosmo_hud:UpdateStress", source, StressAmount)
        end
    end)
end