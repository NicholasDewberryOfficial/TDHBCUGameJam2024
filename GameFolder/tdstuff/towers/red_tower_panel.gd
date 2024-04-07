extends Panel


@onready var tower = preload("res://tdstuff/towers/red_bullet_tower.tscn")

var currTile 
var movy

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_gui_input(event):
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		add_child(tempTower)
		#tempTower.global_position = event.global_position
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
	elif event is InputEventMouseMotion and event.button_mask ==1:
		if get_child_count() > 1:
			get_child(1).global_position = event.global_position
			movy = (get_child(1).global_position)
	elif event is InputEventMouseButton and event.button_mask == 0:
		if get_child_count() > 1:
			get_child(1).queue_free()
		var path = get_tree().get_root().get_node("localized/DesertTDscene/towers")
		path.add_child(tempTower)
		tempTower.global_position = event.global_position
		tempTower.global_position = movy# (tempTower.global_position))
		tempTower.get_node("Area").hide()
	pass # Replace with function body.
