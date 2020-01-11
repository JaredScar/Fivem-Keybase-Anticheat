-------------------------------
--- Fivem-Keybase-Anticheat ---
-------------------------------
ResourceWhitelistTrack = {}
hashingKey = 'this-is-something-long-and-hard-to-figure-out'
ProtectedServerEvents = {
	'',
	'',
	'',
	'',
}
BlacklistedServerEvents = {
	'',
	'',
	'',
}

AddEventHandler('onResourceStart', function(resource) 
	-- Resource started, give it a hash 
end)

RegisterNetEvent('KB-AC:TriggerServerEvent')
AddEventHandler('KB-AC:TriggerServerEvent', function(resourceName, eventName, params)
	-- TriggerServerEvent('KB-AC:TriggerServerEvent', 'resourceName', 'chatMessage', {-1, 'Hello everybody'});
end)
for i = 1, #ProtectedServerEvents do 
	local eventName = ProtectedServerEvents[i];
	AddEventHandler(eventName, function()
		-- Check if it was verified 
	end)
end
for i = 1, #BlacklistedServerEvents do 
	local eventName = BlacklistedServerEvents[i];
	AddEventHandler(eventName, function()
		-- Malicious user, automatically ban them 
	end)
end