//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:31

/*
	The broadcaster sends processed messages to all radio devices in the game. They
	do not have to be headsets; intercoms and station-bounced radios suffice.

	They receive their message from a server after the message has been logged.
*/

var/list/recentmessages = list() // global list of recent messages broadcasted : used to circumvent massive radio spam
var/message_delay = 0 // To make sure restarting the recentmessages list is kept in sync

/obj/machinery/telecomms/broadcaster
	name = "Subspace Broadcaster"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "broadcaster"
	desc = "A dish-shaped machine used to broadcast processed subspace signals."
	density = 1
	anchored = 1
	use_power = 1
	idle_power_usage = 25
	machinetype = 5
	produces_heat = 0
	delay = 7
	circuitboard = "/obj/item/weapon/circuitboard/telecomms/broadcaster"
	var/overmap_range = 7
	var/obj/effect/overmapobj/transmitting_sector

/obj/machinery/telecomms/broadcaster/initialize()
	..()
	if(!transmitting_sector)
		transmitting_sector = map_sectors["[src.z]"]

/obj/machinery/telecomms/broadcaster/receive_information(datum/signal/signal, obj/machinery/telecomms/machine_from)
	// Don't broadcast rejected signals
	if(signal.data["reject"])
		return

	if(signal.data["message"])

		// Prevents massive radio spam
		signal.data["done"] = 1 // mark the signal as being broadcasted
		// Search for the original signal and mark it as done as well
		var/datum/signal/original = signal.data["original"]
		if(original)
			original.data["done"] = 1
			original.data["compression"] = signal.data["compression"]
			original.data["level"] = signal.data["level"]

		var/signal_message = "[signal.frequency]:[signal.data["message"]]:[signal.data["realname"]]"
		if(signal_message in recentmessages)
			return
		recentmessages.Add(signal_message)

		if(signal.data["slow"] > 0)
			sleep(signal.data["slow"]) // simulate the network lag if necessary

		signal.data["level"] |= listening_level

	   /** #### - Normal Broadcast - #### **/

		/*
		if(signal.data["type"] == 0)

			/* ###### Broadcast a message using signal.data ###### */
			Broadcast_Message(signal.data["connection"], signal.data["mob"],
							  signal.data["vmask"], signal.data["vmessage"],
							  signal.data["radio"], signal.data["message"],
							  signal.data["name"], signal.data["job"],
							  signal.data["realname"], signal.data["vname"],,
							  signal.data["compression"], signal.data["level"], signal.frequency,
							  signal.data["verb"], signal.data["language"],
							  signal.data["sector"], signal.data["range"])


	   /** #### - Simple Broadcast - #### **/

		if(signal.data["type"] == 1)

			/* ###### Broadcast a message using signal.data ###### */
			Broadcast_SimpleMessage(signal.data["name"], signal.frequency,
								  signal.data["message"],null, null,
								  signal.data["compression"], listening_level)


	   /** #### - Artificial Broadcast - #### **/
	   			// (Imitates a mob)

		if(signal.data["type"] == 2)

			/* ###### Broadcast a message using signal.data ###### */
				// Parameter "data" as 4: AI can't track this person/mob

			Broadcast_Message(signal.data["connection"], signal.data["mob"],
							  signal.data["vmask"], signal.data["vmessage"],
							  signal.data["radio"], signal.data["message"],
							  signal.data["name"], signal.data["job"],
							  signal.data["realname"], signal.data["vname"], 4, signal.data["compression"], signal.data["level"], signal.frequency,
							  signal.data["verb"], signal.data["language"],
							  signal.data["sector"], signal.data["range"])
							  */

		if(!message_delay)
			message_delay = 1
			spawn(10)
				message_delay = 0
				recentmessages = list()

		//bounce the signal on the overmap
		if(!transmitting_sector)
			transmitting_sector = map_sectors["[src.z]"]
		/*for(var/obj/effect/overmapobj/overmapobj in range(overmap_range, transmitting_sector))
			overmapobj.distribute_radio_signal(signal)*/

		/* --- Do a snazzy animation! --- */
		flick("broadcaster_send", src)

/obj/machinery/telecomms/broadcaster/Destroy()
	// In case message_delay is left on 1, otherwise it won't reset the list and people can't say the same thing twice anymore.
	if(message_delay)
		message_delay = 0
	..()


/*
	Basically just an empty shell for receiving and broadcasting radio messages. Not
	very flexible, but it gets the job done.
*/

/obj/machinery/telecomms/allinone
	name = "Telecommunications Mainframe"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "comm_server"
	desc = "A compact machine used for portable subspace telecommuniations processing."
	density = 1
	anchored = 1
	use_power = 0
	idle_power_usage = 0
	machinetype = 6
	produces_heat = 0
	var/intercept = 0 // if nonzero, broadcasts all messages to syndicate channel

/obj/machinery/telecomms/allinone/receive_signal(datum/signal/signal)

	if(!on) // has to be on to receive messages
		return

	/*if(!check_receive_level(signal))
		return*/

	if(is_freq_listening(signal)) // detect subspace signals

		signal.data["done"] = 1 // mark the signal as being broadcasted
		signal.data["compression"] = 0

		// Search for the original signal and mark it as done as well
		var/datum/signal/original = signal.data["original"]
		if(original)
			original.data["done"] = 1

		if(signal.data["slow"] > 0)
			sleep(signal.data["slow"]) // simulate the network lag if necessary

		/* ###### Broadcast a message using signal.data ###### */

		var/datum/radio_frequency/connection = signal.data["connection"]
		Broadcast_Message(signal.data["connection"], signal.data["mob"],
						  signal.data["vmask"], signal.data["vmessage"],
						  signal.data["radio"], signal.data["message"],
						  signal.data["name"], signal.data["job"],
						  signal.data["realname"], signal.data["vname"],, signal.data["compression"], list(0), connection.frequency,
						  signal.data["verb"], signal.data["language"],
						  signal.data["sector"], signal.data["range"])

		return

		/*
		if(connection.frequency in ANTAG_FREQS) // if antag broadcast, just
			Broadcast_Message(signal.data["connection"], signal.data["mob"],
							  signal.data["vmask"], signal.data["vmessage"],
							  signal.data["radio"], signal.data["message"],
							  signal.data["name"], signal.data["job"],
							  signal.data["realname"], signal.data["vname"],, signal.data["compression"], list(0), connection.frequency,
							  signal.data["verb"], signal.data["language"])
		else
			if(intercept)
				Broadcast_Message(signal.data["connection"], signal.data["mob"],
							  signal.data["vmask"], signal.data["vmessage"],
							  signal.data["radio"], signal.data["message"],
							  signal.data["name"], signal.data["job"],
							  signal.data["realname"], signal.data["vname"], 3, signal.data["compression"], list(0), connection.frequency,
							  signal.data["verb"], signal.data["language"])
*/


/**

	Here is the big, bad function that broadcasts a message given the appropriate
	parameters.

	@param connection:
		The datum generated in radio.dm, stored in signal.data["connection"].

	@param M:
		Reference to the mob/speaker, stored in signal.data["mob"]

	@param vmask:
		Boolean value if the mob is "hiding" its identity via voice mask, stored in
		signal.data["vmask"]

	@param vmessage:
		If specified, will display this as the message; such as "chimpering"
		for monkies if the mob is not understood. Stored in signal.data["vmessage"].

	@param radio:
		Reference to the radio broadcasting the message, stored in signal.data["radio"]

	@param message:
		The actual string message to display to mobs who understood mob M. Stored in
		signal.data["message"]

	@param name:
		The name to display when a mob receives the message. signal.data["name"]

	@param job:
		The name job to display for the AI when it receives the message. signal.data["job"]

	@param realname:
		The "real" name associated with the mob. signal.data["realname"]

	@param vname:
		If specified, will use this name when mob M is not understood. signal.data["vname"]

	@param data:
		If specified:
				1 -- Will only broadcast to intercoms
				2 -- Will only broadcast to intercoms and station-bounced radios
				3 -- Broadcast to syndicate frequency
				4 -- AI can't track down this person. Useful for imitation broadcasts where you can't find the actual mob

	@param compression:
		If 0, the signal is audible
		If nonzero, the signal may be partially inaudible or just complete gibberish.

	@param level:
		The list of Z levels that the sending radio is broadcasting to. Having 0 in the list broadcasts on all levels

	@param freq
		The frequency of the signal

**/

/proc/Broadcast_Message(var/datum/radio_frequency/connection, var/datum/signal/signal/*var/mob/M,
						var/vmask, var/vmessage, var/obj/item/device/radio/radio,
						var/message, var/name, var/job, var/realname, var/vname,
						var/data, var/compression, var/list/level, var/freq, var/verbage = "says", var/datum/language/speaking = null*/)

	set background = 1

  /* ###### Prepare the radio connection ###### */

	var/display_freq = connection.frequency
	var/datum/language/speaking = signal.language

  /* ###### Get and categorise all radios who got the signal ###### */

	var/list/signal_trace = list()
	var/list/signal_4bar = list()
	var/list/signal_3bar = list()
	var/list/signal_2bar = list()
	var/list/signal_1bar = list()
	var/list/signal_encrypt = list()
	for(var/obj/item/device/radio/radio in connection.devices["[RADIO_CHAT]"])
		switch(radio.get_signal_receive_status(signal))
			if(SIGNAL_TRACE)
				signal_trace.Add(radio)
			if(SIGNAL_4BAR_MOD)
				signal_4bar.Add(radio)
			if(SIGNAL_3BAR_MOD)
				signal_3bar.Add(radio)
			if(SIGNAL_2BAR_MOD)
				signal_2bar.Add(radio)
			if(SIGNAL_1BAR_MOD)
				signal_1bar.Add(radio)
			if(SIGNAL_ENCRYPT)
				signal_encrypt.Add(radio)

	/* ###### Organize the receivers into categories for displaying the message ###### */

	var/list/heard_trace = get_mobs_in_radio_ranges(signal_trace)
	var/list/heard_4bar = get_mobs_in_radio_ranges(signal_4bar)
	var/list/heard_3bar = get_mobs_in_radio_ranges(signal_3bar)
	var/list/heard_2bar = get_mobs_in_radio_ranges(signal_2bar)
	var/list/heard_1bar = get_mobs_in_radio_ranges(signal_1bar)
	var/list/heard_encrypt = get_mobs_in_radio_ranges(signal_encrypt)

	if(length(heard_trace) || length(heard_encrypt))
		//generate a gibberish message
		var/wordsleft = rand(1,10)
		var/gibberish_message = ""
		while(wordsleft > 0)
			wordsleft -= 1
			var/lettersleft = rand(1,10)
			while(lettersleft > 0)
				lettersleft -= 1
				gibberish_message += pick("?","#","@","*","&","^","%","$")
			gibberish_message += " "

		var/part_a = "<span class='radio'><b>\[[display_freq]\]</b> <span class='name'>"
		var/part_b = "</span> <span class='message'>"
		for (var/mob/R in heard_trace)
			R.hear_radio(gibberish_message, "transmits", null, part_a, part_b, null, 0, "(trace signal)" + create_text_tag("wifi0"), 0)
		for (var/mob/R in heard_encrypt)
			R.hear_radio("???? ???? ???? ???? ????", "transmits", null, part_a, part_b, null, 0, "(encrypted)", 0)

  /* ###### Begin formatting and sending the message ###### */
	if (length(heard_4bar) || length(heard_3bar) || length(heard_2bar) || length(heard_1bar))

		//Extract the relevant info
		var/message = signal.data["message"]
		var/ending = copytext(message, length(message))
		var/verbage = "says"
		if(speaking)
			verbage = speaking.get_spoken_verb(ending)
		var/speakername = signal.data["real_name"]
		var/speakerjob = signal.data["speakerjob"]
		var/identifier
		if(speakerjob)
			identifier = "[speakername] ([speakerjob])"
		else
			identifier = speakername
		if(signal.data["encryption_key"])
			identifier += create_text_tag("key")

		var/message_css = signal.data["message_css"]
		if(!message_css)
			message_css = "radio"
		var/channelname = signal.data["channel"]
		var/freq_text
		if(channelname)
			freq_text = "[channelname] [display_freq]"
		else
			freq_text = display_freq

		//Format it
		var/part_a = "<span class='[message_css]'><b>\[[freq_text]\]</b> <span class='name'>"
		var/part_b = "</span> <span class='message'>"

		var/language_message = speaking.scramble(message)

		/* --- Process all the mobs that heard the message with some degree of audibility --- */

		//Perfect reception
		var/wifichattag = create_text_tag("wifi4")
		for (var/mob/R in heard_4bar)
			R.hear_radio(message, verbage, speaking, part_a, part_b, null, 0, identifier + wifichattag, 0, 0, language_message)

		//3 bars of reception
		wifichattag = create_text_tag("wifi3")
		if (length(heard_3bar))
			for (var/mob/R in heard_3bar)
				R.hear_radio(message, verbage, speaking, part_a, part_b, null, 0, identifier + wifichattag, 25, 0, language_message)

		//2 bars of reception
		wifichattag = create_text_tag("wifi2")
		if (length(heard_2bar))
			for (var/mob/R in heard_2bar)
				R.hear_radio(message, verbage, speaking, part_a, part_b, null, 0, identifier + wifichattag, 50, 0, language_message)

		//1 bars of reception
		wifichattag = create_text_tag("wifi1")
		if (length(heard_1bar))
			for (var/mob/R in heard_1bar)
				R.hear_radio(message, verbage, speaking, part_a, part_b, null, 0, identifier + wifichattag, 75, 0, language_message)

	return 1

/proc/Broadcast_SimpleMessage(var/source, var/frequency, var/text, var/data, var/mob/M, var/compression, var/level)

  /* ###### Prepare the radio connection ###### */

	if(!M)
		var/mob/living/carbon/human/H = new
		M = H

	var/datum/radio_frequency/connection = radio_controller.return_frequency(frequency)

	var/display_freq = connection.frequency

	var/list/receive = list()


	// --- Broadcast only to intercom devices ---

	if(data == 1)
		for (var/obj/item/device/radio/intercom/R in connection.devices["[RADIO_CHAT]"])
			var/turf/position = get_turf(R)
			if(position && position.z == level)
				receive |= R.send_hear(display_freq, level)


	// --- Broadcast only to intercoms and station-bounced radios ---

	else if(data == 2)
		for (var/obj/item/device/radio/R in connection.devices["[RADIO_CHAT]"])

			if(istype(R, /obj/item/device/radio/headset))
				continue
			var/turf/position = get_turf(R)
			if(position && position.z == level)
				receive |= R.send_hear(display_freq)


	// --- Broadcast to antag radios! ---

	else if(data == 3)
		for(var/freq in ANTAG_FREQS)
			var/datum/radio_frequency/antag_connection = radio_controller.return_frequency(freq)
			for (var/obj/item/device/radio/R in antag_connection.devices["[RADIO_CHAT]"])
				var/turf/position = get_turf(R)
				if(position && position.z == level)
					receive |= R.send_hear(freq)


	// --- Broadcast to ALL radio devices ---

	else
		for (var/obj/item/device/radio/R in connection.devices["[RADIO_CHAT]"])
			var/turf/position = get_turf(R)
			if(position && position.z == level)
				receive |= R.send_hear(display_freq)


  /* ###### Organize the receivers into categories for displaying the message ###### */

	// Understood the message:
	var/list/heard_normal 	= list() // normal message

	// Did not understand the message:
	var/list/heard_garbled	= list() // garbled message (ie "f*c* **u, **i*er!")
	var/list/heard_gibberish= list() // completely screwed over message (ie "F%! (O*# *#!<>&**%!")

	for (var/mob/R in receive)

	  /* --- Loop through the receivers and categorize them --- */

		if (R.client)
			if(R.client.prefs)
				if(!(R.client.prefs.toggles & CHAT_RADIO)) //Adminning with 80 people on can be fun when you're trying to talk and all you can hear is radios.
					continue
			else
				log_debug("Client prefs found to be null in /proc/Broadcast_SimpleMessage() for mob [R] and client [R.ckey], this should be investigated.")


		// --- Check for compression ---
		if(compression > 0)

			heard_gibberish += R
			continue

		// --- Can understand the speech ---

		if (R.say_understands(M))

			heard_normal += R

		// --- Can't understand the speech ---

		else
			// - Just display a garbled message -

			heard_garbled += R


  /* ###### Begin formatting and sending the message ###### */
	if (length(heard_normal) || length(heard_garbled) || length(heard_gibberish))

	  /* --- Some miscellaneous variables to format the string output --- */
		var/part_a = "<span class='[frequency_span_class(display_freq)]'><span class='name'>" // goes in the actual output
		var/freq_text = get_frequency_name(display_freq)

		// --- Some more pre-message formatting ---

		var/part_b_extra = ""
		if(data == 3) // intercepted radio message
			part_b_extra = " <i>(Intercepted)</i>"

		// Create a radio headset for the sole purpose of using its icon
		var/obj/item/device/radio/headset/radio = new

		var/part_b = "</span><b> \icon[radio]\[[freq_text]\][part_b_extra]</b> <span class='message'>" // Tweaked for security headsets -- TLE
		var/part_blackbox_b = "</span><b> \[[freq_text]\]</b> <span class='message'>" // Tweaked for security headsets -- TLE
		var/part_c = "</span></span>"

		var/blackbox_msg = "[part_a][source][part_blackbox_b]\"[text]\"[part_c]"

		//BR.messages_admin += blackbox_admin_msg
		if(istype(blackbox))
			switch(display_freq)
				if(PUB_FREQ)
					blackbox.msg_common += blackbox_msg
				if(SCI_FREQ)
					blackbox.msg_science += blackbox_msg
				if(COMM_FREQ)
					blackbox.msg_command += blackbox_msg
				if(MED_FREQ)
					blackbox.msg_medical += blackbox_msg
				if(ENG_FREQ)
					blackbox.msg_engineering += blackbox_msg
				if(SEC_FREQ)
					blackbox.msg_security += blackbox_msg
				if(DTH_FREQ)
					blackbox.msg_deathsquad += blackbox_msg
				if(SYND_FREQ)
					blackbox.msg_syndicate += blackbox_msg
				if(SUP_FREQ)
					blackbox.msg_cargo += blackbox_msg
				if(SRV_FREQ)
					blackbox.msg_service += blackbox_msg
				else
					blackbox.messages += blackbox_msg

		//End of research and feedback code.

	 /* ###### Send the message ###### */

		/* --- Process all the mobs that heard the voice normally (understood) --- */

		if (length(heard_normal))
			var/rendered = "[part_a][source][part_b]\"[text]\"[part_c]"

			for (var/mob/R in heard_normal)
				R.show_message(rendered, 2)

		/* --- Process all the mobs that heard a garbled voice (did not understand) --- */
			// Displays garbled message (ie "f*c* **u, **i*er!")

		if (length(heard_garbled))
			var/quotedmsg = "\"[stars(text)]\""
			var/rendered = "[part_a][source][part_b][quotedmsg][part_c]"

			for (var/mob/R in heard_garbled)
				R.show_message(rendered, 2)


		/* --- Complete gibberish. Usually happens when there's a compressed message --- */

		if (length(heard_gibberish))
			var/quotedmsg = "\"[Gibberish(text, compression + 50)]\""
			var/rendered = "[part_a][Gibberish(source, compression + 50)][part_b][quotedmsg][part_c]"

			for (var/mob/R in heard_gibberish)
				R.show_message(rendered, 2)

//Use this to test if an obj can communicate with a Telecommunications Network

/atom/proc/test_telecomms()
	var/datum/signal/signal = src.telecomms_process()
	var/turf/position = get_turf(src)
	return (position.z in signal.data["level"] && signal.data["done"])

/atom/proc/telecomms_process(var/do_sleep = 1)

	// First, we want to generate a new radio signal
	var/datum/signal/signal = new
	signal.transmission_method = 2 // 2 would be a subspace transmission.
	var/turf/pos = get_turf(src)

	// --- Finally, tag the actual signal with the appropriate values ---
	signal.data = list(
		"slow" = 0, // how much to sleep() before broadcasting - simulates net lag
		"message" = "TEST",
		"compression" = rand(45, 50), // If the signal is compressed, compress our message too.
		"traffic" = 0, // dictates the total traffic sum that the signal went through
		"type" = 4, // determines what type of radio input it is: test broadcast
		"reject" = 0,
		"done" = 0,
		"level" = pos.z // The level it is being broadcasted at.
	)
	signal.frequency = PUB_FREQ// Common channel

  //#### Sending the signal to all subspace receivers ####//
	for(var/obj/machinery/telecomms/receiver/R in telecomms_list)
		R.receive_signal(signal)

	if(do_sleep)
		sleep(rand(10,25))

	//world.log << "Level: [signal.data["level"]] - Done: [signal.data["done"]]"

	return signal

