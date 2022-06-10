ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

-- Version Checker
if shared.versioncheck then
    SetTimeout(2000, function()
        PerformHttpRequest("https://api.github.com/repos/xxpromw3mtxx/cosmo_hud/releases/latest", function(status, response)
            if status ~= 200 then return end

            response = json.decode(response)
            if response.prerelease then return end
            
            local currentVersion = GetResourceMetadata(shared.resource, 'version', 0):match('%d%.%d+%.%d+')
            if not currentVersion then return end

            local latestVersion = response.tag_name:match('%d%.%d+%.%d+')
            if currentVersion >= latestVersion then return end

            print(('^3An update is available for %s (current version: %s)\r\n%s^0'):format(shared.resource, currentVersion, response.html_url))
        end, 'GET')
    end)
end

-- Stress related option
if shared.showstress then
    RegisterServerEvent('cosmo_hud:gainStress')
    AddEventHandler('cosmo_hud:gainStress', function(StressAmount)
        local xPlayer = ESX.GetPlayerFromId(source)
        
        if xPlayer ~= nil then
            TriggerClientEvent('esx_status:add', source, 'stress', StressAmount)
            
            TriggerClientEvent("cosmo_hud:UpdateStress", source, StressAmount)
        end
    end)
end