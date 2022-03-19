local QBCore = exports['qb-core']:GetCoreObject()
QBCore.Functions.CreateCallback('RobberyTimer:CanStartRobbery', function(source, cb, type)
    for timertype, timer in pairs(Config.Timers) do
		if timertype == type then
			cb(not timer.cooldown)
			break
		end
	end
	cb(false)
end)

RegisterServerEvent("RobberyTimer:RobberyStarted")
AddEventHandler("RobberyTimer:RobberyStarted", function(type) -- Cooldown between robberies
	local Player = QBCore.Functions.GetPlayer(source)
	for timertype, timer in pairs(Config.Timers) do
		if timertype == type and Config.Timers[timertype].source == source then
			Config.Timers[timertype].cooldown = true
			Config.Timers[timertype].started = true
			Config.Timers[timertype].citizenid = Player.PlayerData.citizenid
			TriggerEvent("qb-log:server:CreateLog", "criminal", "Robbery Started", "green", "**".. GetPlayerName(Config.Timers[timertype].source) .. "** (citizenid: *"..Config.Timers[timertype].citizenid.."* | id: *"..Config.Timers[timertype].source.."*) Started a "..type.." robbery!", false, Config.Timers[timertype].source)
			SetTimeout((Config.Timers[timertype].cooldowntimer*60)*1000, function() 
				Config.Timers[timertype].cooldown = false
				if Config.Timers[timertype].reseteventtype == 'client' then
					TriggerClientEvent(Config.Timers[timertype].resetevent, Config.Timers[timertype].source)
				else
					TriggerEvent(Config.Timers[timertype].resetevent)
				end
			end)
		end
	end
end)

RegisterServerEvent("RobberyTimer:RobberyReserved")
AddEventHandler("RobberyTimer:RobberyReserved", function(type)
	local Player = QBCore.Functions.GetPlayer(source)
	for timertype, timer in pairs(Config.Timers) do
		if timertype == type then
			Config.Timers[timertype].cooldown = true
			Config.Timers[timertype].source = source
			Config.Timers[timertype].citizenid = Player.PlayerData.citizenid
			TriggerEvent("qb-log:server:CreateLog", "criminal", "Robbery Reserved", "blue", "**".. GetPlayerName(Config.Timers[timertype].source) .. "** (citizenid: *"..Config.Timers[timertype].citizenid.."* | id: *"..Config.Timers[timertype].source.."*) Reserved a "..type.." robbery!", false, Config.Timers[timertype].source)
			SetTimeout((Config.Timers[timertype].timer*60)*1000, function()
				if not Config.Timers[timertype].started then
					TriggerEvent("qb-log:server:CreateLog", "criminal", "Robbery Reservation Expired", "red", "**".. Config.Timers[timertype].source .. "** (citizenid: *"..Config.Timers[timertype].citizenid.."* | id: *"..Config.Timers[timertype].source.."*)"..type.." robbery reservation expired!!", false, Config.Timers[timertype].source)
					Config.Timers[timertype].cooldown = false
					TriggerClientEvent(Config.Timers[timertype].source, Config.Timers[timertype].queueevent)
				end
			end)
		end
	end
end)

RegisterServerEvent("RobberyTimer:ResetTimer")
AddEventHandler("RobberyTimer:ResetTimer", function()
	for k,v in pairs(Config.Timers) do
		v.cooldown = false
	end
end)

AddEventHandler('onResourceStart', function(resource)
	if resource ~= GetCurrentResourceName() then	
	    return
	end
	for k,v in pairs(Config.Timers) do
		SetTimeout((v.timer*60)*1000, function()
			v.cooldown = false
		end)
	end    print('GLOBAL BANK TIMER HAS BEEN STARTED')
end)

RegisterCommand('resetrobberies', function(source, args, rawCommand)
	if source == 0 then
		for k,v in pairs(Config.Timers) do
			v.cooldown = false
		end
		print('GLOBAL BANK TIMER HAS BEEN RESET!')
	end
end, false)