/*
GLOBAL_LIST_EMPTY(commando_spawn)

/datum/spawnpoint/commando_spawn
	display_name = "GAO Battlejumper"
	restrict_job = list("GAO Battlejumper")

/datum/spawnpoint/commando_spawn/New()
	..()
	turfs = GLOB.commando_spawn
*/
/obj/effect/landmark/start/commando_spawn
	name = "GAO Battlejumper"
/*
/obj/effect/landmark/start/commando_spawn/New()
	..()
	GLOB.commando_spawn += loc
*/

/*
GLOBAL_LIST_EMPTY(commando_officer_spawn)

/datum/spawnpoint/commando_officer_spawn
	display_name = "GAO Battlejumper Officer"
	restrict_job = list("GAO Battlejumper Officer")

/datum/spawnpoint/commando_officer_spawn/New()
	..()
	turfs = GLOB.commando_officer_spawn
*/
/obj/effect/landmark/start/commando_officer_spawn
	name = "GAO Battlejumper Officer"
/*
/obj/effect/landmark/start/commando_officer_spawn/New()
	..()
	GLOB.commando_officer_spawn += loc
*/
/obj/effect/landmark/start/commando_captain_spawn
	name = "GAO Battlejumper Captain"
/*
/obj/effect/landmark/start/commando_captain_spawn/New()
	..()
	GLOB.commando_captain_spawn += loc
*/
