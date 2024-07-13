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
			$maintext.text="Wait, before we start: Commander.... Do you want to go over the basics real fast??" 
			$startgamebutton.visible = true
			$NoDoTutorial.show()
		18: 
			$maintext.text = "Alrighty. So Let's take a look at the main game screen."
		19: 
			$Speaker_Left.hide() 
			$Speaker_Right.hide() 
			
			$Panel.hide()
			$bg.texture = ResourceLoader.load("res://IntroCutscene/bgimgs/GameScreen1.png")
			$maintext.text = "This game is a hybrid tower defense/RPG, lets break down what that means."
		20:
			$bg.texture	 = ResourceLoader.load("res://IntroCutscene/bgimgs/gamescreen2.png")
			$maintext.text = "On the left side of the screen, we have an RPG section featuring everyone's favorite: Myrtle the cactus."
		21:
			$maintext.text = "Use the keyboard to control his actions in RPG combat. Some enemies are weak to some things, while resisting other things. Make sure to experiment with attacks!"
		22:
			$maintext.text= "Make sure Myrtle doesn't get hurt here. If he does, he spends 150 PP to get back into the fight."
		23:
			$maintext.text = "Protip: The big robots resist everything except 'Disperse'. Plan accordingly. "
		24:
			$bg.texture = ResourceLoader.load("res://IntroCutscene/bgimgs/gamescreen3.png")
			$maintext.text = "Now, let's go to the tower defense portion."
		25:
			$maintext.text = "Click and drag from the right side to place towers onto the map. Spend PP on towers and upgrades. Make sure to keep Mrytle healed up! He has no health cap! "
		26:
			$maintext.text = "That's all my advice. Good luck!"
			$startgamebutton.show()
		
			
func appendText(text):
	if(! text in $maintext.text):
		$maintext.text += text
	
func _on_nextbutton_pressed():
	state +=1 
	pass # Replace with function body.

func _on_startgamebutton_pressed():
	get_tree().change_scene_to_file("res://combined/localizedcombinedgame.tscn")
	pass # Replace with function body.
	
func current_speaker(state):
	match state:
		3:
			$Panel3.show()
			$SpeakerName.show()
			$SpeakerName.text = "Domino"
			$Speaker_Right.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Secretary_Idle(2).png")
	
		4:
			$SpeakerName.text = "Wheel"
			$Speaker_Left.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Commander_Ponder.png")
		
		5:
			$SpeakerName.text = "Domino"
			$Speaker_Right.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Secretary_Idle(2).png")
	
		6:
			$SpeakerName.text = "Wheel"
			$Speaker_Left.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Commander_Idle.png")
		7:
			$SpeakerName.text = "Domino"
			$Speaker_Right.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Secretary_Worried(2).png")
		8:
			$SpeakerName.text = "Myrtle"
			$Speaker_Left.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Player_Happy(2).png")
		10:
			$Speaker_Left.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Player_Determined(2).png")
		11:
			$SpeakerName.text = "Wheel"
			$Speaker_Right.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Commander_Ponder.png")
			
		12:
			$Panel3.hide()
			$SpeakerName.hide()
		
		13:
			$Panel3.show()
			$SpeakerName.show()
			$Speaker_Right.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Commander_Ponder_Smile.png")
			
		14:
			$Speaker_Right.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Commander_Idle_Smirk.png")
			
		15:
			$SpeakerName.text = "Myrtle"
			$Speaker_Left.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Player_Happy(2).png")
		17: 
			$Panel3.show()
			$SpeakerName.show()
			$SpeakerName.text = "Domino"
			$Speaker_Right.texture =  ResourceLoader.load("res://Assets/Talk_Sprites/Cactus_Secretary_Idle(2).png")	
	


func _on_no_do_tutorial_pressed():
	$NoDoTutorial.hide()
	$startgamebutton.hide()
	
	pass # Replace with function body.
