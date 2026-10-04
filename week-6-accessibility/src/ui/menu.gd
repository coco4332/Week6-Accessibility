class_name Menu
extends Control

signal opened()
signal closed()

@export var close_on_start: bool = false
@export var parent_menu: Menu = null
@export var close_button: Button = null

func _ready() -> void:
	if close_on_start:
		close()
	if close_button:
		close_button.pressed.connect(previous_menu)

func previous_menu() -> void:
	close()
	if parent_menu:
		Game.audio_menu_select()
		parent_menu.open()

func open() -> void:
	show()
	opened.emit()

func close() -> void:
	hide()
	closed.emit()
