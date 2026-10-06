class_name StartMenu
extends Menu

@export var start_button: Button = null
@export var quit_button: Button = null
@export_file("*.tscn") var game_scene: String = ""

func _ready() -> void:
	super._ready()
	start_button.pressed.connect(_on_start_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _on_start_pressed() -> void:
	Game.audio_menu_select()
	if game_scene.is_empty():
		print("No game scene set yet")
		return
	get_tree().change_scene_to_file(game_scene)

func _on_quit_pressed() -> void:
	Game.audio_menu_select()
	get_tree().quit()
