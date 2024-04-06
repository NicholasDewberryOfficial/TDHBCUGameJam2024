extends Node2D


var state: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match state:
		0:
			pass
		1:
			appendText("\n \n It has been years since the machine lord awakened and started destroying nature. Industrial machines with the sole purpose of destruction rose up out of nowhere as an unstoppable horde and declared war on the rest of the world. Their objective is to destroy the world cores, natural crystals that maintain equilibrium in nature. They have no guiding values other than pure chaos and destruction. They never had reason to begin with, and peace is impossible.")
		2:
			appendText("\n \n  The cactusfolk have been on the frontlines of this conflict, mostly on defense. You see, the industrial zone that the machines call their home base is surrounded on all sides by desert - a biome that wrecks havok on these robots. Their sensors get destroyed, their parts overheat, and they really can't navigate the terrain. The cactusfolk have spent a lot of time taking in refugees and preparing a counterattack. ")
		3:
			appendText("\n \n 'Hey captain do you want the good news, or the bad news first?' ")
		4:
			appendText("\n 'I'll take the bad news'. ")
		5:
			appendText("\n  'The robots are coming. They're gonna send out some scouts first, but it'll get rough later on. We've got to set up defenses - but this area doesn't have the plant power we need. We need to take it from them as they invade. If you think about it, fossil fuels are basically plant energy, so we can use it'")
		6:
			appendText("\n 'That doesn't make much sense - but I'll roll with it. And the good news?'")
		7:
			appendText("\n A short cactus with a wide smile enters the room. His gallon hat and sheer audacity makes the commander pause. 'It's time for our counterattack.' ")
		8:
			$maintext.text = "'Listen cap... we've got different goals, but we want the same thing. We want to Keep it alive.' the cactus spreads his hands out with whoosh to exaggerate. The captain is not impressed - in the slightest"
		9:
			appendText("\n \n 'Ahem. Like I was saying. You want to keep it alive through defense - but I want to keep it alive through offense. I'll go behind enemy lines - all sneaky-like and fight the machine lord myself. How's that sound?'")
		10:
			appendText("\n The commander scowled. Myrtle the cactus is undeniably talented. He's got what it takes. But it will be a difficult plan. ")
		11:
			appendText("\n \n To [b] keep it alive, [/b] it is necessary to fight on two fronts. On the left hand, Myrtle will be attacking and engaging enemies in one on one combat. On the right hand, the cactusfolk will assemble in defensive formations, protecting the world core. A conundrum to be sure, but still doable.")
		12:
			appendText("\n This requires tactics and planning. The commander makes up his mind. 'We shall be sharing our plantpower, Myrtle.' \n \n 'Take this necklace. Every enemy you destroy down shall empower us too - and we will be able to give each other upgrades. [b] Choosing what to focus on will be important. We require extra tools and more units, and you require more health and damage. [/b] Let's balance our needs.'")		
		13:
			appendText("\n Myrtle smiles. 'I'll save everyone. Time to get to work! '")
		14:
			appendText("\n He jumps out the window - forgetting his necklace. The commander realizes this and throws it down, and Myrtle gets bumped on the head as he falls. No worries though.")
		15:
			appendText("'It's go time! ' ")
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
