
/obj/item/weapon/gun/projectile/ma3_ar
	name = "\improper MA3 Assault Rifle"
	desc = "An obsolete military assault rifle commonly available on the black market. Takes 7.62mm ammo."
	icon_state = "MA3"
	item_state = "ma3"
	magazine_type = /obj/item/ammo_magazine/ma3/m118
	ammo_icon_state = null
	allowed_magazines = list(/obj/item/ammo_magazine/ma3/m118)
	attachment_slots = null
	attachments_on_spawn = null
	burst = 4
	burst_delay = 1.7
	one_hand_penalty = -1
	dispersion = list(0.2,0.3,0.5,0.73)
	fire_sound = 'code/modules/halo/sounds/MA3firefix.ogg'
	reload_sound = 'code/modules/halo/sounds/MA3reload.ogg'

	attachment_slots = list("underbarrel rail","sight","barrel")
	attachments_on_spawn = list(/obj/item/weapon_attachment/light/flashlight)


/obj/item/weapon/gun/projectile/ma3/update_icon()
	. = ..()
	if(ammo_magazine)
		icon_state = "MA3"
	else
		icon_state = "MA3_unloaded"

//Basic Magazine

/obj/item/ammo_magazine/ma3
	name = "MA3 magazine"
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "MA3_mag"
	mag_type = MAGAZINE
	caliber = "7.62mm"
	max_ammo = 40
	multiple_sprites = 1

//M118 Ammunition

/obj/item/ammo_magazine/ma3/m118
	name = "MA3 magazine (7.62mm) M118"
	desc = "7.62x51mm M118 Full Metal Jacket Armour Piercing (FMJ-AP) magazine for the MA3 containing 40 shots."
	ammo_type = /obj/item/ammo_casing/m118

/obj/item/weapon/storage/box/ma3_m118
	name = "box of MA3 7.62mm M118 magazines"
	startswith = list(/obj/item/ammo_magazine/ma3/m118 = 7)
