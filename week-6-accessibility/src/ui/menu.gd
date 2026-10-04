class_name Menu
extends Control

signal opened()
signal closed()

@export var close_on_start: bool = false

func open() -> void:
	show()
	opened.emit()

func close() -> void:
	hide()
	closed.emit()
