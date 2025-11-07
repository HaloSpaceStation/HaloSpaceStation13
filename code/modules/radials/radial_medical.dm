/proc/radial_medical(mob/living/carbon/patient, mob/doctor)
	var/mob/living/carbon/human/H = patient
	var/radial_state = ""
	var/obj/item/organ/external/part = null

	var/list/radial_options = list()

	for(var/bodypart in BP_ALL_LIMBS)
		part = H.get_organ(bodypart)
		if(!part.burn_dam)
			if(!part.brute_dam)
				radial_state = "radial_[bodypart]_un"
			else
				radial_state = "radial_[bodypart]_brute"
		else
			if(part.brute_dam)
				radial_state = "radial_[bodypart]_both"
			else
				radial_state = "radial_[bodypart]_burn"
		if(part.get_incision())
			radial_state = "radial_[bodypart]_surgery"

		radial_options[bodypart] = image(icon = 'icons/mob/radial.dmi', icon_state = radial_state)

	//the list of the above
	var/list/radial_options_show = list("head" = radial_options[BP_HEAD],
									"chest" = radial_options[BP_CHEST],
									"Rarm" = radial_options[BP_R_ARM],
									"Rhand" = radial_options[BP_R_HAND],
									"Rleg" = radial_options[BP_R_LEG],
									"Rfoot" = radial_options[BP_R_FOOT],
									"Lfoot" = radial_options[BP_L_FOOT],
									"Lleg" = radial_options[BP_L_LEG],
									"Lhand" = radial_options[BP_L_HAND],
									"Larm" = radial_options[BP_L_ARM],
									"groin" = radial_options[BP_GROIN])

	var/obj/item/organ/external/affecting = null
	var/choice = show_radial_menu(doctor, H, radial_options_show, null, 30, null, TRUE) //Assign a fucking unique ID LMAO
	switch(choice)
		if("head")
			affecting = H.get_organ(BP_HEAD)
		if("chest")
			affecting = H.get_organ(BP_CHEST)
		if("groin")
			affecting = H.get_organ(BP_GROIN)
		if("Larm")
			affecting = H.get_organ(BP_L_ARM)
		if("Lhand")
			affecting = H.get_organ(BP_L_HAND)
		if("Rarm")
			affecting = H.get_organ(BP_R_ARM)
		if("Rhand")
			affecting = H.get_organ(BP_R_HAND)
		if("Lleg")
			affecting = H.get_organ(BP_L_LEG)
		if("Lfoot")
			affecting = H.get_organ(BP_L_FOOT)
		if("Rleg")
			affecting = H.get_organ(BP_R_LEG)
		if("Rfoot")
			affecting = H.get_organ(BP_R_FOOT)
	return affecting
