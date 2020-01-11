-------------------------------
--- Fivem-Keybase-Anticheat ---
-------------------------------
ResourceWhitelistTrack = {}
ProtectedServerEvents = {
	{'', 'thisIsOurKey'},
	{'', 'KEY-FOR-EVENT'},
	{'', 'KEY-FOR-EVENT'},
	{'', 'KEY-FOR-EVENT'},
	{'', 'KEY-FOR-EVENT'},
	{'', 'KEY-FOR-EVENT'},
}
ProtectedClientEvents = {
	{'', 'thisIsOurKey'},
	{'', 'KEY-FOR-EVENT'},
	{'', 'KEY-FOR-EVENT'},
	{'', 'KEY-FOR-EVENT'},
	{'', 'KEY-FOR-EVENT'},
	{'', 'KEY-FOR-EVENT'},
}
BlacklistedServerEvents = {
  "antilynxr4:detect",
  "ynx8:anticheat",
  "antilynx8r4a:anticheat",
  "lynx8:anticheat",
}

ProperlyVerified = {}
RegisterNetEvent('KB-AC:TriggerServerEvent')
AddEventHandler('KB-AC:TriggerServerEvent', function(eventKey, eventName, ...)
	-- TriggerServerEvent('KB-AC:TriggerServerEvent', 'eventKey', 'eventName', 'chatMessage', toWho, param1, param2, param3);
	for i = 1, #ProtectedServerEvents do 
		local protectedEvent = ProtectedServerEvents[i];
		if protectedEvent[1] == eventName then 
			if protectedEvent[2] == eventKey then 
				-- It is a valid triggered server event, set it off correctly:
				TriggerEvent(eventName, ...);
				local args = {...};
				ProperlyVerified[eventName] = true;
			end
		end
	end
end)
RegisterNetEvent('KB-AC:TriggerClientEvent')
AddEventHandler('KB-AC:TriggerClientEvent', function(eventKey, eventName, ...)
	-- TriggerServerEvent('KB-AC:TriggerServerEvent', 'eventKey', 'eventName', 'chatMessage', toWho, param1, param2, param3);
	for i = 1, #ProtectedClientEvents do 
		local protectedEvent = ProtectedClientEvents[i];
		if protectedEvent[1] == eventName then 
			if protectedEvent[2] == eventKey then 
				-- It is a valid triggered server event, set it off correctly:
				TriggerClientEvent(eventName, ...);
				local args = {...};
				ProperlyVerified[eventName] = true;
			end
		end
	end
end)
RegisterNetEvent('KB-AC:CheckClientEvent')
AddEventHandler('KB-AC:CheckClientEvent', function(eventName)
end)

for i = 1, #ProtectedServerEvents do 
	local protectedEvent = ProtectedServerEvents[i];
	local eventEvent = protectedEvent[1];
	AddEventHandler(eventEvent, function()
		-- Check if it's verified 
		if ProperlyVerified[eventEvent] ~= nil then 
			ProperlyVerified[eventEvent] = nil;
		else 
			-- Not verified event 
			CancelEvent();
		end
	end)
end
for i = 1, #BlacklistedServerEvents do 
	local eventName = BlacklistedServerEvents[i];
	AddEventHandler(eventName, function()
		-- Malicious user, automatically ban them 
		TriggerClientEvent('KB-AC:TriggerClientEvent', 'chatMessageKey', 'chatMessage', 'Player ' .. GetPlayerName(source) .. 
			' would be banned by BlacklistedServerEvents')
	end)
end