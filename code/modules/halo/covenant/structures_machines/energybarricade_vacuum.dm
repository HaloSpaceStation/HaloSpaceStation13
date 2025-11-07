
/obj/item/energybarricade/vacuum_shield
	name = "vacuum shield (packed)"
	desc = "A shimmering solid shield for sealing hull breaches in an emergency. This one is deactivated for transport."
	icon = 'energybarricade.dmi'
	icon_state = "vacuum"
	shield_type = /obj/structure/energybarricade/vacuum_shield



/obj/structure/energybarricade/vacuum_shield
	name = "vacuum shield"
	desc = "A shimmering solid shield for sealing hull breaches in an emergency."
	icon_state = "shield-old"
	fail_state = "blueshatter2"
	max_shield = 100
	recharge_time = 30
	blocks_air = 1
	blocks_mobs = 0
	item_type = /obj/item/energybarricade/vacuum_shield

/obj/structure/energybarricade/vacuum_shield/update_icon()
	if(shield_health > 0)
		icon_state = initial(icon_state)
	else
		icon_state = fail_state

/obj/structure/energybarricade/vacuum_shield/c_airblock(turf/other)
	if(shield_health > 0)
		return AIR_BLOCKED
	return ZONE_BLOCKED

/*
	Code for vac shield holder.

*/

/obj/structure/energybarricade/vacuum_shield/attackby(obj/item/weapon/W as obj, mob/user as mob) //Huragok instantly collapses the shield.
	if(istype(W,/obj/item/vacuum_shield_holder))
		visible_message("[user] collapses \the [src.name].")
		new/obj/item/energybarricade/vacuum_shield(get_turf(src))
		spawn(0)
			qdel(src)
	return
	..()

/obj/item/energybarricade/vacuum_shield/attackby(obj/item/weapon/W as obj, mob/user as mob) //Huragok picks it up to add back to holder.

	if(istype(W,/obj/item/vacuum_shield_holder))
		var/obj/item/vacuum_shield_holder/RH = W
		if(!RH.held)
			to_chat(user, "<span class='notice'>You collect the vacuum shield.</span>")
			src.forceMove(RH)
			RH.held = src
			return

	..()

/obj/item/vacuum_shield_holder
	name = "vacuum shield rack"
	desc = "A rack for carrying a vacuum shield."
	icon = 'energybarricade.dmi'
	icon_state = "vacuum"
	var/obj/item/energybarricade/vacuum_shield/held

/obj/item/vacuum_shield_holder/New()
	..()
	held = new /obj/item/energybarricade/vacuum_shield(src)

/obj/item/vacuum_shield_holder/attack_self(mob/user as mob)

	if(!held)
		to_chat(user, "<span class='notice'>The rack is empty.</span>")
		return

	to_chat(user, "<span class='notice'>You deploy the vacuum shield.</span>")
	var/obj/structure/energybarricade/vacuum_shield/R = new /obj/structure/energybarricade/vacuum_shield(user.loc)
	R.add_fingerprint(user)
	qdel(held)
	held = null
