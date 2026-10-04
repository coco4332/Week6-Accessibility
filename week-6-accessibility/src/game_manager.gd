extends Node

enum Difficulty {
	EASY = 1,
	NORMAL = 2,
	HARD = 3
}

signal difficulty_changed(new_dif: Difficulty)
signal master_volume_changed(new_vol: float)
signal music_volume_changed(new_vol: float)

@export var _difficulty_level: Difficulty = Difficulty.NORMAL
@export var _master_volume: float = 1
@export var _music_volume: float = 1

var difficulty_level: Difficulty = Difficulty.NORMAL:
	get: return _difficulty_level
	set(val): 
		if val != _difficulty_level:
			_difficulty_level = val
			difficulty_changed.emit(val)

var master_volume: float:
	get: return _master_volume
	set(val):
		if val != _master_volume:
			_master_volume = val
			master_volume_changed.emit(val)

var music_volume: float:
	get: return _music_volume
	set(val):
		if val != _music_volume:
			_music_volume = val
			music_volume_changed.emit(val)

func _ready() -> void:
	difficulty_changed.emit(_difficulty_level)
	master_volume_changed.emit(_master_volume)
	music_volume_changed.emit(_music_volume)
