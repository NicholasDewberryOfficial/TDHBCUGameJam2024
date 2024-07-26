extends ProgressBar

@export var movingfollownode: PathFollow2D
@export var pressedbool: bool 
@export var checkbutton: CheckButton
@export var combocountnumber: RichTextLabel
@export var combobar : ProgressBar
@export var combocountnum: int

#directly pass the combo value to the upper script, so it can be given to the task list
#goes this node -> actionrpg battle -> task list through direct reference
@export var mybase: Node
func _ready():
	pass

func _process(delta):
	if(Input.is_action_just_pressed("Q")):
		pressedbool =! pressedbool
	combocountnumber.text = str(combocountnum)
	checkbutton.button_pressed = pressedbool
	mybase.parentcombocountershouldbequal = combocountnum
	
func runcombologic():
	if(pressedbool):
		combocountnum += 1 
		pressedbool=false
	else:
		combobar.value -=1
	if(combobar.value ==0):
		combocountnum = 0
		combobar.value=3 
		
			


func _on_topsidearea_area_entered(area):
	runcombologic()
	pass # Replace with function body.


func _on_bottomsidearea_area_entered(area):
	runcombologic()
	pass # Replace with function body.
