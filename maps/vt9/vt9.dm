
/datum/map/vt9
	name = "VT9-042"
	full_name = "VT9-042"
	system_name = "111 Tauri System"

	path = "vt9"
	station_levels = list()
	admin_levels = list()
	accessible_z_levels = list()
	lobby_icon = 'code/modules/halo/splashworks/title6.jpg'
	id_hud_icons = 'maps/ks7_elmsville/hud_icons.dmi'

	station_name  = "Geminus City"
	station_short = "Geminus"
	dock_name     = "Landing Pad"
	boss_name     = "United Nations Space Command"
	boss_short    = "UNSC HIGHCOM"
	company_name  = "United Nations Space Command"
	company_short = "UNSC"
	overmap_size= 150
	overmap_event_tokens = 100

	use_overmap = 1
	allowed_gamemodes = list("reclamation")

	area_coherency_test_exempt_areas = list(
		/area/space,
		/area/exoplanet,
		/area/exoplanet/desert,
		/area/exoplanet/grass,
		/area/exoplanet/snow
		)

#if !defined(using_map_DATUM)
	#define using_map_DATUM /datum/map/vt9

#include "unit_tests.dm"

#include "../../code/modules/halo/lobby_music/odst_music.dm"
#include "../../code/modules/halo/lobby_music/halo_music.dm"

#include "../npc_ships/om_ship_areas.dm"

#include "../area_holders/include.dm"

#include "../Admin Planet/includes.dm"

#include "../faction_bases/faction_base_unsc.dm"
#include "../faction_bases/faction_base_cov.dm"

#include "../faction_bases/cov_base/include.dm"

#include "../faction_bases/Cassius_Base/include.dm"

#include "../CRS_Unyielding_Transgression/includes.dm"

#include "../UNSC_Difference_Of_Opinion/includes.dm"

#include "../Exoplanet Research/includes.dm"

#include "../glassed_planet/includes.dm"

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring VT9-042

#endif

/datum/map/vt9
	allowed_jobs = list(
	/datum/job/unsc/spartan_two,
	/datum/job/unsc/crew,
	/datum/job/unsc/medical,
	/datum/job/unsc/marine,
	/datum/job/unsc/marine/specialist,
	/datum/job/unsc/marine/hellbringer,
	/datum/job/unsc/marine/squad_leader,
	/datum/job/unsc/odst,
	/datum/job/unsc/odst/squad_leader,
	/datum/job/unsc/commanding_officer,
	/datum/job/unsc/executive_officer,
	/datum/job/unsc/oni/field_agent,
	/datum/job/unsc/oni/research,
	/datum/job/unsc/oni/research/director,
	/datum/job/unsc_ai,
	/datum/job/covenant/AI,
	/datum/job/covenant/huragok,
	/datum/job/covenant/sangheili_minor,
	/datum/job/covenant/sangheili_major,
	/datum/job/covenant/sangheili_honour_guard,
	/datum/job/covenant/sangheili_ultra,
	/datum/job/covenant/sangheili_shipmaster,
	/datum/job/covenant/sangheili_specops,
	/datum/job/covenant/lesser_prophet,
	/datum/job/covenant/kigyarminor,
	/datum/job/covenant/unggoy_minor,
	/datum/job/covenant/unggoy_major,
	/datum/job/covenant/unggoy_ultra,
	/datum/job/covenant/unggoy_deacon,
	/datum/job/covenant/unggoy_heavy,
	/datum/job/covenant/unggoy_specops,
	/datum/job/covenant/skirmmurmillo,
	/datum/job/covenant/skirmcommando,
	/datum/job/covenant/skirmchampion,
	/datum/job/covenant/brute_minor,
	/datum/job/covenant/brute_major,
	/datum/job/covenant/brute_captain,
	/datum/job/covenant/yanmee_minor,
	/datum/job/covenant/yanmee_major,
	/datum/job/covenant/yanmee_ultra,
	/datum/job/covenant/yanmee_leader,
	/datum/job/covenant/mgalekgolo,
		)

	allowed_spawns = list(
		DEFAULT_SPAWNPOINT_ID,
		"UNSC Base Spawns",
		"UNSC Base Fallback Spawns",
		"Covenant Base Fallback Spawns",
		)

	default_spawn = DEFAULT_SPAWNPOINT_ID

