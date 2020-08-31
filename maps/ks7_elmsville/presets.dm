//This file contains map-specific item presets such as doors and other similar items.//

/mob/living/simple_animal/hostile/pirate_defender
	name = "Pirate Recruit"
	desc = "An unaffiliated human pirate, looking for scrap and treasure."
	icon = 'code/modules/halo/icons/mobs/ks7_pirate.dmi'
	icon_state = "pirate_recruit"
	icon_living  = "pirate_recruit"
	icon_dead = "pirate_recruit_dead"
	health = 100
	maxHealth = 100
	resistance = 5
	possible_weapons = list(\
	/obj/item/weapon/gun/projectile/m6d_magnum,
	/obj/item/weapon/gun/projectile/ma5b_ar,
	/obj/item/weapon/gun/projectile/ma37_ar,
	/obj/item/weapon/gun/projectile/ma3_ar,
	/obj/item/weapon/gun/energy/plasmapistol,
	)

/mob/living/simple_animal/hostile/pirate_defender/civ
	name = "Civillian Pirate"
	desc = "Not all men are destined for the fighting life, although this one still carries a sidearm."
	icon = 'code/modules/halo/icons/mobs/ks7_pirate.dmi'
	icon_state = "pirate_civ"
	icon_living  = "pirate_civ"
	icon_dead = "pirate_civ_dead"
	health = 100
	maxHealth = 100
	resistance = 0
	possible_weapons = list(\
	/obj/item/weapon/gun/projectile/m7_smg,
	/obj/item/weapon/gun/projectile/m6d_magnum,
	/obj/item/weapon/gun/energy/plasmapistol
	)

/mob/living/simple_animal/hostile/pirate_defender/medium
	name = "Pirate Mercenary"
	desc = "A survivor of rigorous initiation, looking for treasure and scrap."
	icon = 'code/modules/halo/icons/mobs/ks7_pirate.dmi'
	icon_state = "pirate_merc"
	icon_living  = "pirate_merc"
	icon_dead = "pirate_merc_dead"
	health = 100
	maxHealth = 100
	resistance = 10
	possible_weapons = list(\
	/obj/item/weapon/gun/projectile/ma5b_ar,
	/obj/item/weapon/gun/energy/plasmarifle,
	/obj/item/weapon/gun/projectile/needler,
	/obj/item/weapon/gun/projectile/br55,
	/obj/item/weapon/gun/projectile/m392_dmr
	)

/mob/living/simple_animal/hostile/pirate_defender/heavy
	name = "Heavily-Armed Pirate"
	desc = "Some men are better suited for a fighting life. This is one of them."
	icon = 'code/modules/halo/icons/mobs/ks7_pirate.dmi'
	icon_state = "pirate_heavy"
	icon_living  = "pirate_heavy"
	icon_dead = "pirate_heavy_dead"
	health = 100
	maxHealth = 100
	resistance = 15
	possible_weapons = list(\
	/obj/item/weapon/gun/projectile/shotgun/pump/m45_ts,
	/obj/item/weapon/gun/projectile/br55,
	/obj/item/weapon/gun/projectile/m392_dmr,
	/obj/item/weapon/gun/projectile/ma5b_ar,
	/obj/item/weapon/gun/projectile/type51carbine,
	/obj/item/weapon/gun/projectile/type31needlerifle,
	/obj/item/weapon/gun/energy/plasmarifle
	)
	wander = 0

/obj/item/weapon/card/id/building_key
	name = "Key"
	desc = "A keycard in the shape of a manual-lock key. Scan against a door to open."
	icon = 'icons/obj/items.dmi'
	icon_state = "keys"
	slot_flags = SLOT_BELT|SLOT_ID|SLOT_EARS

/obj/item/weapon/card/id/building_key/house1 //Access num generated by conversion of "H[num]" to ascii-number, stripping 0s
	name = "Key (Residence 1)"
	access = list(7249)

/obj/item/weapon/card/id/building_key/house2
	name = "Key (Residence 2)"
	access = list(7250)

/obj/item/weapon/card/id/building_key/house3
	name = "Key (Residence 3)"
	access = list(7251)

/obj/item/weapon/card/id/building_key/house4
	name = "Key (Residence 4)"
	access = list(7252)

/obj/item/weapon/card/id/building_key/house5
	name = "Key (Residence 5)"
	access = list(7253)

/obj/item/weapon/card/id/building_key/house6
	name = "Key (Residence 6)"
	access = list(7254)

/obj/item/weapon/card/id/building_key/house7
	name = "Key (Residence 7)"
	access = list(7255)

/obj/item/weapon/card/id/building_key/house8
	name = "Key (Residence 8)"
	access = list(7256)

/obj/machinery/door/airlock/house_1
	name = "New Pompeii Residence 1"
	req_access = list(7249)
	secured_wires = 1 //Key'd doors are secure-locked to make breaking in a bit harder.

/obj/machinery/door/airlock/house_2
	name = "New Pompeii Residence 2"
	req_access = list(7250)
	secured_wires = 1

/obj/machinery/door/airlock/house_3
	name = "New Pompeii Residence 3"
	req_access = list(7251)
	secured_wires = 1

/obj/machinery/door/airlock/house_4
	name = "New Pompeii Residence 4"
	req_access = list(7252)
	secured_wires = 1

/obj/machinery/door/airlock/house_5
	name = "New Pompeii Residence 5"
	req_access = list(7253)
	secured_wires = 1

/obj/machinery/door/airlock/house_6
	name = "New Pompeii Residence 6"
	req_access = list(7254)
	secured_wires = 1

/obj/machinery/door/airlock/house_7
	name = "New Pompeii Residence 7"
	req_access = list(7255)
	secured_wires = 1

/obj/machinery/door/airlock/house_8
	name = "New Pompeii Residence 8"
	req_access = list(7256)
	secured_wires = 1

/obj/item/weapon/card/id/building_key/biodome //"BD"
	name = "Key (Biodome)"
	access = list(6668)

/obj/machinery/door/airlock/biodome
	name = "Biodome"
	stripe_color = "#b7f27d"
	req_access = list(6668)

/obj/machinery/door/airlock/biodome/public
	req_access = list()

/obj/item/weapon/card/id/building_key/police_station //"PL"
	name = "Key (Police Station)"
	access = list(8076)

/obj/machinery/door/airlock/police
	name = "Police Station"
	door_color = "#9d2300"
	req_access = list(8076)
	secured_wires = 1

/obj/machinery/door/airlock/police/comms
	name = "Comms Relay Shack"
	desc = "Requires a colonial marshall or the mayor to open."

/obj/machinery/door/airlock/multi_tile/police
	name = "Police Station"
	door_color = "#9d2300"
	req_access = list(8076)
	secured_wires = 1

/obj/machinery/door/airlock/multi_tile/police/external
	req_access = list()

/obj/item/weapon/card/id/building_key/casino_backroom //Access generated similar to housekeys, "CB" to ascii num, stripping 0s
	name = "Key (Casino Backroom)"
	access = list(6766)

/obj/machinery/door/airlock/casino_backrooms
	name = "Casino Backroom"
	door_color = "#b88a3b"
	req_access = list(6766)
	secured_wires = 1

/obj/item/weapon/card/id/building_key/hospital //"HP"
	name = "Key (Hospital)"
	access = list(7280)

/obj/item/weapon/card/id/building_key/pharmacy //"PH"
	name = "Key (Pharmacy)"
	access = list(8072)

/obj/machinery/door/airlock/hospital
	name = "Hospital"
	door_color = "#ffffff"
	stripe_color = "#00e1ff"
	req_access = list(7280)
	secured_wires = 1

/obj/machinery/door/airlock/multi_tile/hospital
	name = "Hospital"
	door_color = "#ffffff"
	stripe_color = "#00e1ff"
	req_access = list(7280)

/obj/machinery/door/airlock/multi_tile/hospital/external
	req_access = list()

/obj/machinery/door/airlock/hospital/pharmacist
	name = "Pharmacy"
	door_color = "#ffffff"
	stripe_color = null
	req_access = list(8072)
	secured_wires = 1

/obj/item/weapon/card/id/building_key/living_quarters1//"L1"
	name = "Key (Medical Quarters 1)"
	req_access = list(7649)

/obj/item/weapon/card/id/building_key/living_quarters2
	name = "Key (Medical Quarters 2)"
	req_access = list(7650)

/obj/item/weapon/card/id/building_key/living_quarters3
	name = "Key (Medical Quarters 3)"
	req_access = list(7651)

/obj/machinery/door/airlock/hospital/living_quarters1
	name = "On-Site Living Quarters - 1"
	req_access = list(7649)
	secured_wires = 1

/obj/machinery/door/airlock/hospital/living_quarters2
	name = "On-Site Living Quarters - 2"
	req_access = list(7650)
	secured_wires = 1

/obj/machinery/door/airlock/hospital/living_quarters3
	name = "On-Site Living Quarters - 3"
	req_access = list(7651)
	secured_wires = 1

/obj/item/weapon/card/id/building_key/bar //Access generated similar to housekeys, "BR" to ascii num, stripping 0s
	name = "Key (Bar)"
	access = list(6682)

/obj/machinery/door/airlock/bar
	name = "Shatter Point Bar"
	door_color = "#b88a3b"
	req_access = list(6682)
	secured_wires = 1

/obj/item/weapon/card/id/building_key/kitchen //"KT"
	name = "Key (Kitchen)"
	access = list(7584)

/obj/machinery/door/airlock/kitchen
	name = "Kitchen"
	door_color = "#ffffff"
	req_access = list(7584)
	secured_wires = 1

/obj/machinery/door/airlock/bar/public
	req_access = list()
	secured_wires = 0

/obj/item/weapon/card/id/building_key/museum_library //"ML"
	name = "Key (Museum/Library)"
	access = list(7776)

/obj/machinery/door/airlock/museum_library
	name = "Museum/Library"
	req_access = list(7776)
	secured_wires = 1

/obj/machinery/door/airlock/museum_library/public
	req_access = list()
	secured_wires = 0

/obj/item/weapon/card/id/building_key/aerodrome //"AD"
	name = "Key (Aerodrome)"
	access = list(6568)

/obj/machinery/door/airlock/aerodrome
	name = "Aerodrome"
	req_access = list(6568)
	secured_wires = 1

/obj/item/weapon/card/id/building_key/mayor_master//"MR"
	name = "Key (Master Governmental)"
	access = list(7782,6668,8076,7280,8072,7776,6568)

/obj/machinery/door/airlock/shopdoor
	name = "Apartment Store Backroom"
	req_access = list(8380)
	secured_wires = 1

/obj/item/weapon/card/id/building_key/shopdoor//"SP"
	name = "Key (Apartment Store)"
	access = list(8380)

/obj/machinery/door/airlock/apartmentmanager
	name = "Apartment Manager"
	req_access = list(6577)
	secured_wires = 1

/obj/item/weapon/card/id/building_key/apartmentmanager//"AM"
	name = "Key (Apartment Manager)"
	access = list(6577)

/obj/machinery/door/airlock/mayor_only
	name = "Mayor-Only"
	door_color = "#6a97b0"
	req_access = list(7782)

/obj/machinery/button/remote/blast_door/aerodrome_exit
	name = "Aedrodrome Exit Shutters"
	_wifi_id = "aerodromeExit"
	pixel_y = 21
	req_access = list(6568)

/obj/machinery/button/windowtint/bar_window
	name = "Window Tinting"
	id = "barwindow"
	pixel_y = -21
	req_access = list(6682)

/obj/machinery/button/windowtint/casino_window
	name = "Window Tinting"
	id = "casinoBackroom"
	req_access = list(6766)

/obj/machinery/button/remote/blast_door/casino_shutter
	name = "Shutter Control"
	_wifi_id = "casinoShutter"
	id = "casinoShutter"
	req_access = list(6766)

/obj/machinery/button/remote/blast_door/bar_shutter
	name = "Shutter Control"
	_wifi_id = "barShutter"
	id = "barShutter"
	req_access = list(6682)


/obj/structure/closet/secure_closet/ks7_police
	name = "Police Patrol Gear Locker"
	desc = "Use this to protect the citizens of your planet from hostile wildlife and people."
	icon = 'icons/obj/guncabinet.dmi'
	icon_broken = "closed_full"
	icon_closed = "closed_full"
	icon_locked = "closed_full"
	icon_off = "closed_full"
	icon_opened = "open_full"
	icon_state = "closed_full"

/obj/structure/closet/secure_closet/ks7_police/WillContain()
	return list(\
	/obj/item/clothing/under/marshall,
	/obj/item/clothing/head/soft/emsville_marshall,
	/obj/item/clothing/head/helmet/emsville_marshall,
	/obj/item/clothing/suit/storage/marine/emsville_marshall,
	/obj/item/clothing/shoes/marine/emsville_marshall,
	/obj/item/clothing/gloves/thick/unsc/emsville_marshall,
	/obj/item/weapon/storage/belt/marine_ammo,
	/obj/item/weapon/gun/projectile/ma3_ar,
	/obj/item/weapon/gun/projectile/m6d_magnum/police,
	/obj/item/weapon/storage/backpack/marine,
	/obj/item/weapon/melee/baton/humbler,
	/obj/item/weapon/storage/box/handcuffs
	)

/obj/structure/closet/secure_closet/ks7_police/ammo
	name = "Police Patrol Ammunition Locker"
	icon = 'icons/obj/closet.dmi'
	icon_broken = "hossecurebroken"
	icon_closed = "hossecure"
	icon_locked = "hossecure1"
	icon_off = "hossecureoff"
	icon_opened = "hossecureopen"
	icon_state = "hossecure1"

/obj/structure/closet/secure_closet/ks7_police/ammo/WillContain()
	return list(\
	/obj/item/ammo_magazine/ma37/m118,/obj/item/ammo_magazine/ma37/m118,/obj/item/ammo_magazine/ma37/m118,
	/obj/item/ammo_magazine/ma37/m118,/obj/item/ammo_magazine/ma37/m118,/obj/item/ammo_magazine/ma37/m118,
	/obj/item/ammo_magazine/ma37/m118,/obj/item/ammo_magazine/ma37/m118,/obj/item/ammo_magazine/ma37/m118,
	/obj/item/ammo_magazine/ma37/m118,/obj/item/ammo_magazine/ma37/m118,/obj/item/ammo_magazine/ma37/m118,
	/obj/item/ammo_magazine/m6d/m224,/obj/item/ammo_magazine/m6d/m224,/obj/item/ammo_magazine/m6d/m224,
	/obj/item/ammo_magazine/m6d/m224,/obj/item/ammo_magazine/m6d/m224,/obj/item/ammo_magazine/m6d/m224,
	/obj/item/ammo_magazine/m6d/m224,/obj/item/ammo_magazine/m6d/m224,/obj/item/ammo_magazine/m6d/m224,
	/obj/item/ammo_magazine/m6d/m224,/obj/item/ammo_magazine/m6d/m224,/obj/item/ammo_magazine/m6d/m224
	)

/obj/structure/closet/secure_closet/ks7_civ
	name = "Civilian Self-Defense Storage Locker"
	icon_state = "cabinetdetective"
	icon_broken = "cabinetdetective_broken"
	icon_closed = "cabinetdetective"
	icon_locked = "cabinetdetective_locked"
	icon_off = "cabinetdetective_broken"
	icon_opened = "cabinetdetective_open"
	icon_state = "cabinetdetective_locked"

/obj/structure/closet/secure_closet/ks7_civ/WillContain()
	return list(\
	/obj/item/clothing/suit/storage/marine/emsville_marshall/civ,
	/obj/item/ammo_magazine/m6d/m224,/obj/item/ammo_magazine/m6d/m224,/obj/item/ammo_magazine/m6d/m224,
	/obj/item/ammo_magazine/m6d/m224,/obj/item/ammo_magazine/m6d/m224
	)


/obj/machinery/autolathe/ammo_fabricator/police_station
	/*
	machine_recipes = newlist(\
	/datum/autolathe/recipe/m255_sap_he,
	/datum/autolathe/recipe/m255_sap_hp,
	/datum/autolathe/recipe/m443_fmj
	)
	*/
