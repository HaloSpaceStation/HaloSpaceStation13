
/datum/job/unsc/marine
	title = "Marine"
	outfit_type = /decl/hierarchy/outfit/job/unsc/marine
	alt_titles = list(\
		"Assault Recon Marine",\
		"Designated Marksman Marine",\
		"Marine Combat Medic",\
		"Marine Combat Technician",\
		"EVA Operations Marine" = /decl/hierarchy/outfit/job/unsc/marine/eva)
	access = list(access_unsc,access_unsc_armoury,access_unsc_marine)

/datum/job/unsc/marine/eva
	title = "EVA Combat Marine"
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/unsc/marine/eva/e3
	alt_titles = list()

/datum/job/unsc/marine/specialist
	title = "Marine Specialist"
	total_positions = 4
	spawn_positions = 4
	outfit_type = /decl/hierarchy/outfit/job/unsc/marine/e3
	alt_titles = list(
	"Light Machine Gunner Marine",\
	"Scout Sniper Marine",\
	"Anti-Tank Marine",\
	"EVA Operations Specialist" = /decl/hierarchy/outfit/job/unsc/marine/eva/e4)
	access = list(access_unsc,access_unsc_armoury,access_unsc_marine,access_unsc_specialist)
	open_slot_on_death = 1

	radio_speech_size = RADIO_SPEECH_SPECIALIST

/datum/job/unsc/marine/squad_leader
	title = "Marine Sergeant"
	total_positions = 1
	spawn_positions = 1
	department_flag = COM
	outfit_type = /decl/hierarchy/outfit/job/unsc/marine/e5
	alt_titles = list(\
		"Marine Staff Sergeant" = /decl/hierarchy/outfit/job/unsc/marine/e6,\
		"Marine Gunnery Sergeant" = /decl/hierarchy/outfit/job/unsc/marine/e7,\
		"EVA Operations Team Leader" = /decl/hierarchy/outfit/job/unsc/marine/eva/e6)
	access = list(access_unsc,access_unsc_cargo,access_unsc_armoury,access_unsc_marine,access_unsc_specialist)
	open_slot_on_death = 1

	radio_speech_size = RADIO_SPEECH_LEADER

/datum/job/unsc/marine/iwo
	title = "Infantry Weapons Officer"
	total_positions = 1
	spawn_positions = 1
	economic_modifier = 1.5
	outfit_type = /decl/hierarchy/outfit/job/unsc/marine/e7
	access = list(access_unsc,access_unsc_cargo,access_unsc_armoury,access_unsc_marine,access_unsc_specialist)

	radio_speech_size = RADIO_SPEECH_LEADER

/datum/job/unsc/marine/hellbringer
	title = "Hellbringer"
	total_positions = 2
	spawn_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/unsc/marine/hellbringer
	alt_titles = list("Flamethrower Operator" = /decl/hierarchy/outfit/job/unsc/marine/hellbringer)
	access = list(access_unsc,access_unsc_armoury,access_unsc_marine,access_unsc_specialist)
	faction_whitelist = null

	radio_speech_size = RADIO_SPEECH_SPECIALIST

/datum/job/unsc/skirmseppie
	title = "T-Vaoan Seperatist"
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/skirmisher_unsc
	access = list(access_unsc,access_unsc_medical,access_unsc_marine,access_unsc_armoury)
	whitelisted_species = list(/datum/species/kig_yar_skirmisher)
	faction_whitelist = null
	pop_balance_mult = 1.5

	radio_speech_size = RADIO_SPEECH_SPECIALIST
