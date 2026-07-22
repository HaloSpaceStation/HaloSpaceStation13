//Used to process objects. Fires once every second.

SUBSYSTEM_DEF(processing)
	name = "Processing"
	priority = 25
	flags = SS_BACKGROUND|SS_POST_FIRE_TIMING|SS_NO_INIT
	wait = 10

	var/list/processing = list()
	var/list/current_run = list()
	var/process_proc = "Process"

/datum/controller/subsystem/processing/stat_entry()
	..(processing.len)

/datum/controller/subsystem/processing/fire(resumed = 0)
	if (!resumed)
		src.current_run = processing.Copy()
	//cache for sanic speed (lists are references anyways)
	var/list/c_current_run = current_run
	var/c_wait = wait
	var/c_times_fired = times_fired

	while(c_current_run.len)
		var/datum/thing = c_current_run[c_current_run.len]
		c_current_run.len--
		if(QDELETED(thing) || (call(thing, process_proc)(c_wait, c_times_fired) == PROCESS_KILL))
			thing.is_processing = null
			processing -= thing
		if (MC_TICK_CHECK)
			return
