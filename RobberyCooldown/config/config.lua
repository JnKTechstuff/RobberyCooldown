Config = {}

Config.Timers = {
	['EXAMPLE'] = {
		timer = 15,  -- How long should they have the ability to start? (Queue/Reservation time) (MINUTES)
		cooldowntimer = 25, -- Timer between robberies after started (MINUTES)
		cooldown = true, -- Can you rob this when the server opens? Aka cooldown on script start
		source = nil, -- Stores who has this robbery (this means there can only be 1 of each right now) (Don't touch)
		queueevent = 'qb-soreobbery:client:TimerUp', -- Fire this event if they fail to start before queue time
		resetevent = 'qb-soreobbery:client:TimerUp', -- Fire this event when the cooldown is over
		reseteventtype = 'client', -- Type of reset event 
		started = false -- Have they started (Don't touch)
	},
}
