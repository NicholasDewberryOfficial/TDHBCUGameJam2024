extends Node

#ok this needs some explenation. basically, for every level, we change the array. 
@export var missionarray = [0,0,0,0,0,0,0]
@export var myvboxcontainer: VBoxContainer
@export var idealtextlabel: PackedScene
@export var activatedmissions: = []

var currphasetracker:int = 0
var currcomboreference: int =0
var currtoweramt: int=0
var currupgradeamt: int=0
var amtofupgrades: int=0

func _ready():
	assignmissions()
	
func assignmissions():
	if(missionarray[0] == 1):
		#begin mission logic 
		myvboxcontainer.add_child((addtextwiththistext("Reach phase 4")))
		activatedmissions.push_front(0)
		#myvboxcontainer.add_child()
	if(missionarray[1] == 1):
		myvboxcontainer.add_child((addtextwiththistext("Reach Level 5 on the left side combo counter!")))
		activatedmissions.push_front(1)
	if(missionarray[2] == 1):
		myvboxcontainer.add_child((addtextwiththistext("Place at least three towers!")))
		activatedmissions.push_front(2)
	if(missionarray[3] == 1):
		myvboxcontainer.add_child((addtextwiththistext("Make at least three upgrades!")))
		activatedmissions.push_front(3)
		
func addtextwiththistext(writethis) -> RichTextLabel:
	var returnval = idealtextlabel.instantiate()
	returnval.text = writethis
	return returnval
	
func _process(delta): 
	if(activatedmissions.is_empty()):
		#begin scene transition 
		#play animation then swap
		pass
		
func _on_mobholder_reachedthiswave(currentwave):
	if(currentwave>=4 and missionarray[0] == 1):
		missionarray[0]==2
		print("mission1 accomplished")
		activatedmissions.erase(0)
	
	
		
	pass # Replace with function body.


func _on_currenttowerupgrades_upgradecompleted():
	if(missionarray[3] == 1):
		amtofupgrades +=1 
	if(amtofupgrades >= 4):
		missionarray[3] = 2 
		activatedmissions.erase(3)
	pass # Replace with function body.
