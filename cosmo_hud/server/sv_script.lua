ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

-- Version Checker
if Config.CheckVersion then
    PerformHttpRequest("https://raw.githubusercontent.com/xxpromw3mtxx/cosmo_hud/main/.version", function(err, text, headers)
        Citizen.Wait(2000)
        local curVer = GetResourceMetadata(GetCurrentResourceName(), "version")

        if (text ~= nil) then
            if (text ~= curVer) then
                print("^3[update] ^0There's and update available on GitHub.")
            else
                print("^2[info] ^0You are running the latest version.")
            end
        else
            print("^8[error] ^0There was an error while retrieving the online version.")
        end 
    end)
end

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