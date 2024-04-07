extends Node2D


var state: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_speaker(state)
	match state:
		0:
			pass
		1:
			$maintext.text = "Ever since the Mechanix Corporation came into power many years ago, it has been hellbent on consuming and destroying nature. With the resources the company acquires from its excursions, industrial machines began to be mass produced to take more and more, their ultimate goal being to consume the entire world. "
		2:
			$maintext.text = "The cactusfolk, having lived in harmony with the sunscorched desert for a long time, have been on the frontlines of this conflict, mostly on defense. You see, one of the main outposts for the Mechanix Corp. is surrounded on all sides by desert - a biome that wrecks havok on the robots they produce. Their sensors get destroyed, their parts overheat, and they really can't navigate the terrain. The cactusfolk have spent a lot of time taking in refugees and preparing a counterattack. "
		3:
			$maintext.text = "'Hello Commander Wheel. Do you want the good news, or the bad news first?' "
		4:
			$maintext.text = "'I'll take the bad news'. "
		5:
			$maintext.text = "'The robots are coming. They're gonna send out some scouts first, but it'll get rough later on. We've got to set up defenses - but this area doesn't have the plant power we need. We need to take it from them as they invade. If you think about it, fossil fuels are basically plant energy, so we can use it.'"
		6:
			$maintext.text = "'That doesn't make much sense - but I'll roll with it. And the good news?'"
		7: 
			$maintext.text = "'Well, its about-"
		8:
			$maintext.text = "A short cactus with a wide smile enters the room. His gallon hat and sheer audacity makes the commander pause. 'It's time for our counterattack.' "
		9:
			$maintext.text = "'Listen cap... we got different goals, but we want the same thing. We wanna Keep the Oasis Alive!' the cactus spreads his hands out with whoosh to exaggerate. The captain is not impressed - in the slightest"
		10:
			$maintext.text = "'Ahem. Like I was saying. You wanna keep it alive through defense - but I wanna trash those hunks o' junk myself. I'll go behind enemy lines - all sneaky-like and take 'em down from the inside. How's that sound?'"
		11:
			$maintext.text = "The commander scowled. Myrtle the cactus is undeniably talented. He's got what it takes. But it will be a difficult plan. "
		12:
			$maintext.text = "To [b] keep it alive, [/b] it is necessary to fight on two fronts. On the left hand, Myrtle will be attacking and engaging enemies in one on one combat. On the right hand, the cactusfolk will assemble in defensive formations, protecting the world core. A conundrum to be sure, but still doable."
		13:
			$maintext.text = "This requires tactics and planning. The commander makes up his mind. "
		14: 
			$maintext.text = "'We'll be sharing our plantpower, kid. Here, take this necklace. Every enemy you down'll empower us too - and we'll be able to give each other upgrades. [b] Choosing what to focus on will be important. We require extra tools and more units, and you require more health and damage. [/b] Let's balance our needs.'"
		15:
			$maintext.text = "Myrtle smiles. 'I'll save everyone. Time to get to work! '"
		16:
			$maintext.text = "He jumps out the window - forgetting his necklace. Domino realizes this and throws it down, and Myrtle gets bumped on the head as he falls. No worries though."
		17:
			appendText("\n \n 'It's go time! ' ")
			$startgamebutton.visible = true
			
func appendText(text):
	if(! text in $maintext.text):
		$maintext.text += text
	
func _on_nextbutton_pressed():
	state +=1 
	pass # Replace with function body.

func _on_startgamebutton_pressed():
	get_tree().change_scene_to_file("res://RPGStuff/RPGScene.tscn")
	pass # Replace with function body.
	
func current_speaker(state):
	match state:
		3:
			$Panel3.show()
			$SpeakerName.show()
			$SpeakerName.text = "Domino"
			$Speaker1.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Secretary_Idle.png")
	
		4:
			$SpeakerName.text = "Wheel"
			$Speaker2.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Commander_Ponder.png")
		
		5:
			$SpeakerName.text = "Domino"
			$Speaker1.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Secretary_Idle.png")
	
		6:
			$SpeakerName.text = "Wheel"
			$Speaker2.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Commander_Idle.png")
		7:
			$SpeakerName.text = "Domino"
			$Speaker1.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Secretary_Worried.png")
		8:
			$Speaker2.hide()
			$SpeakerName.text = "Myrtle"
			$Speaker3.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Player_Happy.png")
		10:
			$Speaker3.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Player_Determined.png")
		11:
			$Speaker1.hide()
			$SpeakerName.text = "Wheel"
			$Speaker4.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Commander_Ponder.png")
			
		12:
			$Panel3.hide()
			$SpeakerName.hide()
		
		13:
			$Panel3.show()
			$SpeakerName.show()
			$Speaker4.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Commander_Ponder_Smile.png")
			
		14:
			$Speaker4.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Commander_Idle_Smirk.png")
			
		15:
			$SpeakerName.text = "Myrtle"
			$Speaker3.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Player_Happy.png")
			
# func speaker_position():
	
