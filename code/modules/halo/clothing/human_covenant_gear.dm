
#define HUMAN_GEAR_ICON 'code/modules/halo/clothing/human_covenant_gear.dmi'

/obj/item/clothing/under/human_internal
	name = "Human Internal Jumpsuit"
	desc = "A form fitting undersuit for humans."
	icon = HUMAN_GEAR_ICON
	icon_override = HUMAN_GEAR_ICON
	icon_state = "jumpsuit"
	item_state_slots = list(slot_l_hand_str = "armor", slot_r_hand_str = "armor")
	species_restricted = list("Human")
	body_parts_covered = UPPER_TORSO | LOWER_TORSO | ARMS | LEGS
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 0, rad = 0)
	matter = list("cloth" = 1)

/obj/item/clothing/suit/armor/special/human_combat_harness
	name = "Repurposed Combat Harness"
	desc = "An unknown pattern of combat harness, sporting minimal armor and shielding"
	icon = HUMAN_GEAR_ICON
	icon_override = HUMAN_GEAR_ICON
	icon_state = "harness"
	item_state = "harness"
	species_restricted = list("Human")
	blood_overlay_type = "armor"
	item_state_slots = list(slot_l_hand_str = "armor", slot_r_hand_str = "armor")
	body_parts_covered = ARMS|UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 40, bullet = 45, laser = 45, energy = 45, bomb = 40, bio = 25, rad = 25)
	armor_thickness = 15
	totalshields = 20
	specials = list(/datum/armourspecials/shields/unggoy)

/obj/item/clothing/head/helmet/human_combat_helmet
	name = "Repurposed Combat Helmet"
	desc = "An unknown pattern of combat helmet."
	icon = HUMAN_GEAR_ICON
	icon_override = HUMAN_GEAR_ICON
	icon_state = "helmet"
	item_state = "helmet"
	item_flags = THICKMATERIAL
	body_parts_covered = HEAD
	armor = list(melee = 40, bullet = 30, laser = 40,energy = 20, bomb = 25, bio = 0, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7
	w_class = 3
	integrated_hud = /obj/item/clothing/glasses/hud/tactical/covenant

/obj/item/clothing/gloves/thick/human_combat_gauntlets
	name = "Repurposed Combat Gauntlets"
	desc = "An unknown pattern of combat gauntlets."
	icon = HUMAN_GEAR_ICON
	icon_override = HUMAN_GEAR_ICON
	icon_state = "gauntlets"
	item_state = "gauntlets"
	armor = list(melee = 30, bullet = 30, laser = 20, energy = 25, bomb = 15, bio = 0, rad = 0)
	siemens_coefficient = 0.15

/obj/item/clothing/shoes/human_combat_greaves
	name = "Repurposed Combat Greaves"
	desc = "An unknown pattern of combat Greaves."
	icon = HUMAN_GEAR_ICON
	icon_override = HUMAN_GEAR_ICON
	icon_state = "greaves"
	item_state = "greaves"
	force = 5
	armor = list(melee = 40, bullet = 40, laser = 5, energy = 30, bomb = 15, bio = 0, rad = 0)
	siemens_coefficient = 0.6
	body_parts_covered = FEET|LEGS
	item_state_slots = list(
	slot_l_hand_str = "boots",
	slot_r_hand_str = "boots" )
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = FEET
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE

#undef HUMAN_GEAR_ICON