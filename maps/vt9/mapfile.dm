
#include "../_gamemodes/vt9/vt9.dm"

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
