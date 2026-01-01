#if (defined(IN_MAP_EDITOR)||!defined(using_map_DATUM))

	#define using_map_DATUM /datum/map/geminus_city

	#include "invasion_geminus.dm"
	#include "generic_includes.dm"

	#include "../faction_bases/complex046/complex046.dm"

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring GeminusCity

#endif
