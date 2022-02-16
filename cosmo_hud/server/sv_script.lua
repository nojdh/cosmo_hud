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
                print '^1-----------------------------------------^0'
                print '^1        UPDATE AVAILABLE COSMO_HUD       ^0'
                print '^1          GET IT ON GITHUB NOW           ^0'
                print '^1-----------------------------------------^0'
            else
                print("^2COSMO_HUD is up to date!^0")
            end
        else
            print '^1----------------------------------------^0'
            print '^1      ERROR GETTING ONLINE VERSION      ^0'
            print '^1----------------------------------------^0'
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