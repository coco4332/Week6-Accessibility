class_name SubmenuButton
extends Button

@export var parent_menu: Menu = null
@export var submenu: Menu = null

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	submenu.parent_menu = parent_menu
	parent_menu.close()
	submenu.open()
