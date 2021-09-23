ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

-- Version check function
Citizen.CreateThread(function()
    resourceName = string.upper(GetCurrentResourceName())
    
    function checkVersion(err,responseText, headers)
        curVersion = LoadResourceFile(GetCurrentResourceName(), ".version")

        if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
            print("\n###############################")
            print("\n"..resourceName.." is outdated, should be:\n"..responseText.."is:\n"..curVersion.."\nplease update it from https://github.com/xxpromw3mtxx/cosmo_hud/releases")
            print("\n###############################")
        elseif tonumber(curVersion) > tonumber(responseText) then
            print("You somehow skipped a few versions of "..resourceName.." or the git went offline, if it's still online i advise you to update ( or downgrade? )")
        else
            print("^2"..resourceName.." is up to date!^0")
        end
    end
    
    PerformHttpRequest("https://raw.githubusercontent.com/xxpromw3mtxx/cosmo_hud/main/version", checkVersion, "GET")
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