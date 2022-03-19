Config = {}

Config.Timers = {
	['store'] = {
		timer = 15,  -- How long should they have the ability to start?
		cooldowntimer = 25, -- Timer between robberies after started
		cooldown = true, -- No touchy (if you set to false it can be robbed at start)
		source = nil, -- Stores who has this robbery (this means there can only be 1 of each right now)
		queueevent = 'qb-soreobbery:client:TimerUp', -- Fire this event if they fail to start before queue time
		resetevent = 'qb-soreobbery:client:TimerUp', -- Fire this event when the cooldown is over
		reseteventtype = 'client',
		started = false -- Have they started
	},
	['boost'] = {
		timer = 15,  -- How long should they have the ability to start?
		cooldowntimer = 10, -- Timer between robberies after started
		cooldown = false, -- No touchy (if you set to false it can be robbed at start)
		source = nil, -- Stores who has this robbery (this means there can only be 1 of each right now)
		queueevent = 'qb-soreobbery:client:TimerUp', -- Fire this event if they fail to start before queue time
		resetevent = 'qb-soreobbery:client:TimerUp', -- Fire this event when the cooldown is over
		reseteventtype = 'client',
		started = false -- Have they started
	},
	['fleeca'] = {
		timer = 45,  -- How long should they have the ability to start?
		cooldowntimer = 25, -- Timer between robberies after started
		cooldown = true, -- No touchy (if you set to false it can be robbed at start)
		source = nil, -- Stores who has this robbery (this means there can only be 1 of each right now)
		queueevent = 'qb-bankrobbery:server:resetqueue', -- Fire this event if they fail to start before queue time
		resetevent = 'qb-bankrobbery:server:resetfleeca', -- Fire this event when the cooldown is over
		reseteventtype = 'server',
		started = false -- Have they started
	},
}
