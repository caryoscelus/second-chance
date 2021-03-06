extends Node

var story = []

func _ready():
	set_timer(5)
	scene("<Second Chance>")
	scene("a ludum dare 36 game by caryoscelus")
	scene("made in 48 hours time span")
	wait_for_click()
	scene("click to begin")
	
	set_timer(7)
	scene("Pre-historic time\n    unremembered philosopher thought of extraterrestial life", "prehistoric")
	scene("B.C.E VII-V centuries\n    Greek philosophers discuss cosmic pluralism", "greece")
	scene("C.E. 185\n    Chinese astronomers observe a supernova", "china")
	scene("C.E. 1543\n    Copernican revolution begins in astronomy", "copernicus")
	scene("C.E. 1896\n    radioactivity is discovered", "radioactive")
	scene("C.E. 1944, June\n    human-built object crosses boundary of space: V-2 missile", "missile")
	scene("C.E. 1945, July\n    successful nuclear weapon test: Trinity", "trinity")
	scene("C.E. 1957, October\n    artificial Earth satellite: Sputnik", "sputnik")
	#scene("C.E. 1977, August\n    \"Wow! signal\" recieved by Big Ear", "signal")
	scene("C.E. 2012, August\n    Voyager 1 left Solar System", "voyager")
	set_timer(10)
	scene("???? - END OF COMMON ERA\n    nuclear World War III begins", "nuclear")
	scene("P.E. 0, January\n    World Peace Comission (WPC) established by survivors on Australia continent")
	scene("P.E. 3, December\n    International Peace Federation (IPF) is anounced by WPC")
	scene("P.E. 4, May\n    IPF government assumes authority over all Earth")
	scene("P.E. 4, July\n    IPF bans usage and research of nuclear, rocket and computer technologies")
	scene("P.E. 10, August\n    IPF establishes provincial governments across the globe")
	scene("P.E. 100, January\n    celebration of 100 years of peace; Peace Era calendar becomes official")
	scene("P.E. 124, July\n    a bright supernova is seen in the sky")
	scene("P.E. 171, April\n    anonymous analyst suggests that supernova to be artificial")
	scene("P.E. 171, August\n    IPF Science Committee confirms this suggestion")
	scene("P.E. 171, November\n    an undeciphered message is detected in supernova light patterns")
	scene("P.E. 172, August 28th - TODAY\n    the message is deciphered and presented to The Great Leader")
	scene("Leaving out technical details, the message says:")
	wait_for_click()
	scene("""<<WARNING TO ALL SENTIENT BEINGS!
	WE ARE CONDUCTING THE UNIVERSE REBUILDING PROCESS
	BEWARE OF SIDE EFFECTS
	SEND MESSAGE IN REPLY AND WE WON'T TOUCH YOUR SPACE REGION
	YOU'VE BEEN WARNED>>""")
	
	get_parent().load_story(story)
	get_parent().connect("finished_story", self, "load_game")

func load_game():
	get_tree().change_scene("res://scenes/Main.tscn")

var timer = 10
var do_wait_for_click = false

func scene(text, picture=null, bg_color=null):
	var new_scene = {text=text, wait=do_wait_for_click, timer=timer}
	if picture:
		new_scene.picture = picture
	if bg_color:
		new_scene.bg_color = bg_color
	story.append(new_scene)
	do_wait_for_click = false

func wait_for_click():
	do_wait_for_click = true

func set_timer(delay):
	timer = delay
