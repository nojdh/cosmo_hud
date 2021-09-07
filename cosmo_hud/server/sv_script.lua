ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

RegisterServerEvent('cosmo_hud:gainStress')
AddEventHandler('cosmo_hud:gainStress', function(StressAmount)
    local xPlayer = ESX.GetPlayerFromId(source)
	
	if xPlayer ~= nil then
        TriggerClientEvent('esx_status:add', source, 'stress', StressAmount)
	    
        TriggerClientEvent("cosmo_hud:UpdateStress", source, StressAmount)
	end
end)