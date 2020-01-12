-------------------------------
--- Fivem-Keybase-Anticheat ---
-------------------------------
ResourceWhitelistTrack = {}
ProtectedServerEvents = {
	{'KB-AC:UnprotectedExample:OOC', 'KEY-FOR-EVENT'},
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
				ProperlyVerified[eventName] = true;
				TriggerEvent(eventName, ...);
			end
		end
	end
end)
RegisterCommand('testKBAnticheatProtected', function(source, args, rawCommand) 
	-- Testing 
	TriggerEvent('KB-AC:TriggerServerEvent', 'KEY-FOR-EVENT', 'KB-AC:UnprotectedExample:OOC', table.concat(args, ' '))
end)
RegisterNetEvent('KB-AC:UnprotectedExample:OOC')
AddEventHandler('KB-AC:UnprotectedExample:OOC', function(msg)
	TriggerClientEvent('chatMessage', -1, '[OOC] ' .. msg);
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
			-- You could ban them with your ban system here: 
			local src = source;
			if src ~= nil then 
				TriggerClientEvent('chatMessage', -1, 'Player ' .. src .. 
				' would be banned by ProtectedServerEvents')
			end
		end
	end)
end
for i = 1, #BlacklistedServerEvents do 
	local eventName = BlacklistedServerEvents[i];
	AddEventHandler(eventName, function()
		-- Malicious user, automatically ban them 
		TriggerClientEvent('chatMessage', -1, 'Player ' .. GetPlayerName(source) .. 
			' would be banned by BlacklistedServerEvents')
		-- You could ban them with your ban system here: 
	end)
end