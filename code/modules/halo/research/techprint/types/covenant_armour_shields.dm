
/datum/techprint/sangheili_bodysuit
	name = "Sangheili Combat Harness"
	desc = "Analysis of a Covenant Sangheili armour."
	hidden = TRUE
	required_objs = list(/obj/item/clothing/suit/armor/special/combatharness)

/datum/techprint/sangheili_bodysuit_specops
	name = "Sangheili SpecOps Combat Harness"
	desc = "Analysis of a Covenant Sangheili SpecOps armour."
	hidden = TRUE
	required_objs = list(/obj/item/clothing/suit/armor/special/combatharness/specops)

/datum/techprint/unggoy_harness_ultra
	name = "Unggoy Ultra Combat Harness"
	desc = "Analysis of a Covenant Unggoy Ultra armour."
	hidden = TRUE
	required_objs = list(/obj/item/clothing/suit/armor/special/unggoy_combat_harness/ultra)

/datum/techprint/unggoy_harness_deacon
	name = "Unggoy Deacon Combat Harness"
	desc = "Analysis of a Covenant Unggoy Deacon armour."
	hidden = TRUE
	required_objs = list(/obj/item/clothing/suit/armor/special/unggoy_combat_harness/deacon)

/datum/techprint/kigyar_gauntlet
	name = "Kig-Yar shield gauntlet"
	desc = "Analysis of a Covenant Kig-Yar shield gauntlet."
	hidden = TRUE
	required_objs = list(/obj/item/clothing/gloves/shield_gauntlet/minor)

/datum/techprint/tvoan_gauntlet
	name = "T\'Vaoan shield gauntlet"
	desc = "Analysis of a Covenant T\'Vaoan shield gauntlet."
	hidden = TRUE
	required_objs = list(/obj/item/clothing/gloves/skirmisher_shield_gauntlets)
	forbidden_objs = list(/obj/item/clothing/gloves/skirmisher_shield_gauntlets/unsc) // Ensures this item can not be used in ONI research to prevent research-cheese.

/datum/techprint/shield_barricade
	name = "Covenant Shield Barricade"
	desc = "Analysis of a Covenant Shield Barricade."
	hidden = TRUE
	required_objs = list(/obj/item/energybarricade)
