class_name ListenForInput
extends Menu

@export var rebind_action: StringName = &""

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion: return
	if not visible: return
	InputMap.action_erase_events(rebind_action)
	InputMap.action_add_event(rebind_action, event)
	Game.audio_menu_select()
	previous_menu()
