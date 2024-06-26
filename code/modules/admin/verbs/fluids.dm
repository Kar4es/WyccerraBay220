/datum/admins/proc/spawn_fluid_verb()
	set name = "Spawn Water"
	set desc = "Flood the turf you are standing on."
	set category = "Debug"

	if(!check_rights(R_SPAWN)) return
	var/mob/user = usr
	if(istype(user) && user.client)
		for(var/turf/T as anything in RANGE_TURFS(user, 1))
			T.add_fluid(2000, /datum/reagent/water)

/datum/admins/proc/jump_to_fluid_source()

	set name = "Jump To Fluid Source"
	set desc = "Jump to an active fluid source."
	set category = "Debug"

	if(!check_rights(R_SPAWN)) return
	var/mob/user = usr
	if(istype(user) && user.client)
		if(length(SSfluids.water_sources))
			user.forceMove(get_turf(pick(SSfluids.water_sources)))
		else
			to_chat(usr, "No active fluid sources.")

/datum/admins/proc/jump_to_fluid_active()

	set name = "Jump To Fluid Activity"
	set desc = "Jump to an active fluid overlay."
	set category = "Debug"

	if(!check_rights(R_SPAWN)) return
	var/mob/user = usr
	if(istype(user) && user.client)
		if(length(SSfluids.active_fluids))
			user.forceMove(get_turf(pick(SSfluids.active_fluids)))
		else
			to_chat(usr, "No active fluids.")

/turf/simulated/open/flooded
	name = "open water"
	flooded = TRUE

/turf/simulated/ocean/non_flooded
	flooded = FALSE
