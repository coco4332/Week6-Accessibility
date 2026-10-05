class_name InputBinding
extends HBoxContainer

@export var label: Label = null
@export var button: SubmenuButton = null
@export var action: StringName = &""

func _ready() -> void:
	button.pressed.connect(_on_button_pressed)
	label.text = action
	var events = InputMap.action_get_events(action)
	if events:
		button.text = events[0].as_text()

func _on_button_pressed() -> void:
	if button.submenu is ListenForInput:
		var listen := button.submenu as ListenForInput
		listen.rebind_action = action
