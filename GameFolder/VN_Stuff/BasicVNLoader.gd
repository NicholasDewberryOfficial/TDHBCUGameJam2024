extends Node2D


func _ready():
	Dialogic.Styles.load_style("res://VN_Stuff/styles/dewstyle1.tres")
	Dialogic.start(Globalvars.loadthisdialogicscene)
	#Dialogic.Inputs.auto_skip.enabled = !Dialogic.Inputs.auto_skip.enabled
	Dialogic.Inputs.auto_skip.disable_on_unread_text = false

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Dialogic.current_timeline == null):
		Dialogic.start_timeline(Globalvars.loadthisdialogicscene)
	pass

func _input(event:InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		DialogicUtil.autoload().paused = !DialogicUtil.autoload().paused
		$PauseIndictator.visible = DialogicUtil.autoload().paused

	if (event is InputEventMouseButton
	and event.is_pressed()
	and event.button_index == MOUSE_BUTTON_MIDDLE):
		var auto_skip: DialogicAutoSkip = DialogicUtil.autoload().Inputs.auto_skip
		var is_auto_skip_enabled := auto_skip.enabled

		auto_skip.disable_on_unread_text = false
		auto_skip.enabled = !is_auto_skip_enabled
