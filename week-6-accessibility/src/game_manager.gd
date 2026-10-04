class_name GameManager
extends Node

static var instance: GameManager = null

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
@export var _sfx_ui_tick: AudioStream = null
@export var _sfx_ui_select: AudioStream = null
@export var _sfx_music: AudioStream = null
var _ui_audio_player: AudioStreamPlayer = null
var _music_audio_player: AudioStreamPlayer = null

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

func _init() -> void: instance = self

func _ready() -> void:
	_ui_audio_player = AudioStreamPlayer.new()
	add_child(_ui_audio_player)
	_music_audio_player = AudioStreamPlayer.new()
	add_child(_music_audio_player)
	_music_audio_player.stream = _sfx_music
	_music_audio_player.play()
	
	difficulty_changed.connect(_on_difficulty_changed)
	master_volume_changed.connect(_on_master_volume_changed)
	music_volume_changed.connect(_on_music_volume_changed)
	
	difficulty_changed.emit(_difficulty_level)
	master_volume_changed.emit(_master_volume)
	music_volume_changed.emit(_music_volume)

func _on_difficulty_changed(val: Difficulty) -> void:
	Game.audio_menu_tick()

func _on_master_volume_changed(val: float):
	_ui_audio_player.volume_linear = val
	Game.audio_menu_tick()

func _on_music_volume_changed(val: float):
	_music_audio_player.volume_linear = val
	Game.audio_menu_tick()

func audio_menu_tick() -> void:
	if _ui_audio_player.playing: return
	_ui_audio_player.stop()
	_ui_audio_player.stream = _sfx_ui_tick
	_ui_audio_player.play()

func audio_menu_select() -> void:
	_ui_audio_player.stop()
	_ui_audio_player.stream = _sfx_ui_select
	_ui_audio_player.play()
