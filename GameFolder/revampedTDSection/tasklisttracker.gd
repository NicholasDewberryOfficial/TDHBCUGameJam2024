extends Node

#ok this needs some explenation. basically, for every level, we change the array. 
@export var missionarray = [0,0,0,0,0,0,0]
@export var myvboxcontainer: VBoxContainer
@export var idealtextlabel: PackedScene
@export var activatedmissions: = []

@export var transiitionanimplayer: PackedScene

var nodesinmissiontrackergroup: Array[Node] = []

var currphasetracker:int = 0
var currcomboreference: int =0
var currupgradeamt: int=0
var amtofupgrades: int=0

func _ready():
	assignmissions()
	nodesinmissiontrackergroup = get_tree().get_nodes_in_group("missiontracker")

func assignmissions():
	if(missionarray[0] == 1):
		#begin mission logic 
		myvboxcontainer.add_child((addtextwiththistext("Reach phase 4")))
		activatedmissions.push_front(0)
		
		#myvboxcontainer.add_child()
	if(missionarray[1] == 1):
		myvboxcontainer.add_child((addtextwiththistext("Reach Level 5 on the left side combo counter")))
		activatedmissions.push_front(1)
	if(missionarray[2] == 1):
		myvboxcontainer.add_child((addtextwiththistext("Place at least five towers!")))
		activatedmissions.push_front(2)
	if(missionarray[3] == 1):
		myvboxcontainer.add_child((addtextwiththistext("Make at least three upgrades!")))
		activatedmissions.push_front(3)
	if(missionarray[4] == 1):
		myvboxcontainer.add_child((addtextwiththistext("Destroy 10 RPG enemies!")))
		activatedmissions.push_front(4)
	
func addtextwiththistext(writethis) -> RichTextLabel:
	var returnval = idealtextlabel.instantiate()
	returnval.text = writethis
	returnval.name = writethis
	return returnval
	
func _process(delta): 
	if(missionarray[1] == 1):
		runmission1checker()
	if(activatedmissions.is_empty()):
		#begin scene transition 
		var thisanim = transiitionanimplayer.instantiate()
		add_child(thisanim)
		get_tree().paused = true
		#self.paused = false
		#play animation then swap
		pass
		
func _on_mobholder_reachedthiswave(currentwave):
	if(currentwave>=4 and missionarray[0] == 1):
		missionarray[0]==2
		print("mission1 accomplished")
		activatedmissions.erase(0)
		var thistextlabel: RichTextLabel = getlabelwithname("Reach phase 4")
		thistextlabel.text = "[b] Phase 4 reached! [/b]"
	pass # Replace with function body.


func _on_currenttowerupgrades_upgradecompleted():
	if(missionarray[3] == 1):
		amtofupgrades +=1 
	if(amtofupgrades >= 4):
		missionarray[3] = 2 
		activatedmissions.erase(3)
	pass # Replace with function body.
	
func getlabelwithname(thisname) -> Node:
	#for nodesinmissiontrackergroup
	#returns -1. needs to be fixed.
	var i = 0 
	for x in nodesinmissiontrackergroup:
		if x.name == thisname:
			return nodesinmissiontrackergroup[i]
		i  = i+1
	#var pos: int = nodesinmissiontrackergroup.find(str(thisname))
	
#	print("Position is: " + str(pos))
	print("PANIC IN GETTING LABEL NAME! NOT FOUND ! " + thisname)
	return nodesinmissiontrackergroup[-1] 

func runmission1checker():
	if(currcomboreference >= 5 and missionarray[1] == 1):
		missionarray[1] = 2
		activatedmissions.erase(1)
		var thistextlabel: RichTextLabel = getlabelwithname("Reach Level 5 on the left side combo counter")
		thistextlabel.text = "[b] Reached level 5 Combo! [/b]"
		pass
			
func checkcurrtowermission():
	if(missionarray[2] ==1 ):
		missionarray[2] ==2
		activatedmissions.erase(2)
		var thistextlabel: RichTextLabel = getlabelwithname("Place at least five towers!")
		thistextlabel.text = "[b] Placed 5 towers! [/b]"
		pass

