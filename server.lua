-------------------------------
--- Fivem-Keybase-Anticheat ---
-------------------------------
ResourceWhitelistTrack = {}
ProtectedServerEvents = {
	{'chatMessage', 'thisIsOurKey'},
	{'', 'KEY-FOR-EVENT'},
	{'', 'KEY-FOR-EVENT'},
	{'', 'KEY-FOR-EVENT'},
	{'', 'KEY-FOR-EVENT'},
	{'', 'KEY-FOR-EVENT'},
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
AddEventHandler('KB-AC:TriggerServerEvent', function(eventKey, eventName, toWho, params)
	-- TriggerServerEvent('KB-AC:TriggerServerEvent', 'eventKey', 'eventName', 'chatMessage', toWho, {'Hello everybody', 'anotherValue'});
	for i = 1, #ProtectedServerEvents do 
		local protectedEvent = ProtectedServerEvents[i];
		if protectedEvent[1] == eventName then 
			if protectedEvent[2] == eventKey then 
				-- It is a valid triggered server event, set it off correctly:
			end
		end
	end
end)
for i = 1, #ProtectedServerEvents do 
	local protectedEvent = ProtectedServerEvents[i];
	local eventEvent = protectedEvent[1];
	AddEventHandler(eventEvent, function()
		-- Check if it's verified 
	end)
end
for i = 1, #BlacklistedServerEvents do 
	local eventName = BlacklistedServerEvents[i];
	AddEventHandler(eventName, function()
		-- Malicious user, automatically ban them 
	end)
end