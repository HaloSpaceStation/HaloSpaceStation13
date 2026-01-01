/datum/job/soe_commando
	title = "GAO battlejumper"
	spawn_faction = "Insurrection"
	latejoin_at_spawnpoints = 1
	generate_email = 1
	account_allowed = 1
	outfit_type = /decl/hierarchy/outfit/job/gao_battlejumper
	alt_titles = list("Battlejumper Trooper",\
	"Battlejumper Corporal",\
	"Battlejumper Surgeon")

	total_positions = 6
	spawn_positions = 6
	open_slot_on_death = 1
	selection_color = "#ff0000"
	access = list(access_innie,access_innie_prowler,access_innie_asteroid,access_soe)
	faction_whitelist = "Insurrection"
	fallback_spawnpoint = "Innie Base Fallback Spawns"
	whitelisted_species = list(/datum/species/human)
	loadout_allowed = TRUE

	radio_speech_size = RADIO_SPEECH_SPECIALIST

/datum/job/soe_commando_officer
	title = "GAO Battlejumper Officer"
	spawn_faction = "Insurrection"
	latejoin_at_spawnpoints = 1
	generate_email = 1
	account_allowed = 1
	outfit_type = /decl/hierarchy/outfit/job/gao_battlejumper_officer
	alt_titles = list("Battlejumper Sergeant",\
	"Battlejumper Adjutant",\
	"Battlejumper Lieutenant")

	total_positions = 2
	spawn_positions = 2
	selection_color = "#ff0000"
	access = list(access_innie,access_innie_prowler,access_innie_asteroid,access_innie_asteroid_boss,access_soe,access_soe_officer,access_innie_cargo)
	faction_whitelist = "Insurrection"
	whitelisted_species = list(/datum/species/human)
	loadout_allowed = TRUE

	radio_speech_size = RADIO_SPEECH_LEADER

/datum/job/soe_commando_captain
	title = "GAO Battlejumper Captain"
	spawn_faction = "Insurrection"
	latejoin_at_spawnpoints = 1
	generate_email = 1
	account_allowed = 1
	outfit_type = /decl/hierarchy/outfit/job/gao_battlejumper_captain
	alt_titles = list("Battlejumper Commander",\
	"Battlejumper Captain")

	total_positions = 1
	spawn_positions = 1
	selection_color = "#ff0000"
	access = list(access_innie,access_innie_prowler,access_innie_asteroid,access_innie_asteroid_boss,access_soe,access_soe_officer,access_soe_captain,access_innie_cargo)
	faction_whitelist = "Insurrection"
	whitelisted_species = list(/datum/species/human)
	loadout_allowed = TRUE

	radio_speech_size = RADIO_SPEECH_LEADER
