class_name InputBindings
extends Menu

@export var control_blueprint: InputBinding = null
var control_container: Control = null

func _ready() -> void:
	super._ready()
	control_container = control_blueprint.get_parent()
	control_container.remove_child(control_blueprint)
	_build_bind_controls()

func _build_bind_controls() -> void:
	while control_container.get_child_count() > 0: 
		control_container.remove_child(control_container.get_child(0))
	for action in InputMap.get_actions():
		if action.begins_with("ui_"): continue
		var node := control_blueprint.duplicate() as InputBinding
		node.action = action
		node.label.text = action
		control_container.add_child(node)

func open() -> void:
	_build_bind_controls()
	super.open()
