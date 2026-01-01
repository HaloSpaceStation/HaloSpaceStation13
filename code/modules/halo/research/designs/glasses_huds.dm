
/datum/research_design/mesons
	name = "Optical meson scanner"
	desc = "Using the meson-scanning technology those glasses allow you to see through walls, floor or anything else."
	build_type = PROTOLATHE
	required_materials = list("steel" = 10, "glass" = 10, "silver" = 10)
	product_type = /obj/item/clothing/glasses/meson
	complexity = 15

/datum/research_design/nvg
	name = "Night vision goggles"
	desc = "See in low light conditions."
	build_type = PROTOLATHE
	required_materials = list("steel" = 10, "glass" = 10, "silver" = 10)
	product_type = /obj/item/clothing/glasses/night
	complexity = 15

/datum/research_design/thermals
	name = "Optical Thermal scanner"
	desc = "Display heat signatures of living organisms through walls."
	build_type = PROTOLATHE
	required_materials = list("steel" = 15, "glass" = 10, "gold" = 10)
	required_objs = list(/obj/item/crystal/orange)
	product_type = /obj/item/clothing/glasses/thermal
	complexity = 15

/datum/research_design/oms
	name = "Optical material scanner"
	desc = "Observe small items around you through walls."
	build_type = PROTOLATHE
	required_materials = list("steel" = 15, "glass" = 15, "gold" = 20)
	required_objs = list(/obj/item/crystal/orange)
	product_type = /obj/item/clothing/glasses/material
	complexity = 15
