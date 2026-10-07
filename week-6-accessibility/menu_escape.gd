class_name EscapeMenu
extends Menu

@export var resume_button: Button = null
@export var quit_menu_button: Button = null
@export_file("*.tscn") var start_scene: String = "res://obj/ui/menu_start.tscn"

func _ready() -> void:
	super._ready()
	resume_button.pressed.connect(_on_resume_pressed)
	quit_menu_button.pressed.connect(_on_quit_pressed)
	get_tree().paused = true

func _on_resume_pressed() -> void:
	Game.audio_menu_select()
	get_tree().paused = false
	close()
	

func _on_quit_pressed() -> void:
	Game.audio_menu_select()
	get_tree().paused = false
	get_tree().change_scene_to_file(start_scene)
