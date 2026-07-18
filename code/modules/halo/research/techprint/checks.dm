
/datum/techprint
	var/debug_reagents = FALSE

/datum/techprint/proc/check_reagents(var/obj/item/I, var/update_progress = FALSE, var/list/list_search = required_reagents)
	. = FALSE

	if(debug_reagents)	to_debug_listeners("/techprint/proc/check_reagents([I.type], [update_progress])")

	if(list_search.len)
		//grab the reagents datum... the holder can be anything eg different beakers or syringes
		var/datum/reagents/R = I.reagents
		if(R)
			var/success = FALSE
			//loop over the needed chemicals
			for(var/reagent_type in list_search)
				if(debug_reagents)	to_debug_listeners("	check_reagents() [reagent_type]")
				var/result = R.has_reagent(reagent_type, list_search[reagent_type], debug_reagents)
				if(debug_reagents)	to_debug_listeners("	check_reagents() result: [result]")
				if(result)
					if(update_progress)
						//This doesn't use list_search because this is updating the techprint progress.
						//potentially has more than one
						required_reagents -= reagent_type
						consumables_current += 1
						success = TRUE
						continue

					//only need to find one
					return TRUE

			return success

/datum/techprint/proc/check_materials(var/obj/item/I, var/update_progress = FALSE, var/list/list_search = required_materials)
	. = FALSE

	//only check material sheets for now
	if(istype(I, /obj/item/stack/material))
		var/obj/item/stack/material/M = I

		if(list_search.Find(M.default_type) && M.amount >= list_search[M.default_type])
			if(update_progress)
				required_materials -= M.default_type
				consumables_current += 1

			return TRUE

/datum/techprint/proc/check_objs(var/obj/item/I, var/update_progress = FALSE, var/list/list_search = required_objs, var/list/dontmatch = forbbiden_objs)
	. = FALSE

	if(I.type in dontmatch) // Checking if the object is in the forbidden items list defined in _techprint.dm
		return // If it is in the forbidden_objs it then returns the process as it is already defined as FALSE earlier on.

	for(var/checktype in list_search)
		//this will check subtypes as well
		//ss13 code is inconsistent in that:
		//		sometimes subtypes are the same as the parent but with tweaked stats
		//		sometimes subtypes are a substantially different thing
		//this assumes all subtypes are similar enough to be equivalent
		if(istype(I, checktype))
			if(update_progress)
				required_objs -= checktype
				consumables_current += 1

			return TRUE
