-------------------------------
--- Fivem-Keybase-Anticheat ---
-------------------------------
RegisterCommand('testKBAnticheatUnprotected', function(source, args, rawCommand) 
	-- Testing 
	TriggerServerEvent('KB-AC:UnprotectedExample:OOC', table.concat(args, ' '))
end)