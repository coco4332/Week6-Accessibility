class_name Settings
extends Menu

@export var difficulty_slider: HSlider = null
@export var master_vol_slider: HSlider = null
@export var music_vol_slider: HSlider = null

func _ready() -> void:
	super._ready()
	difficulty_slider.value_changed.connect(update_difficulty.unbind(1))
	master_vol_slider.value_changed.connect(update_master_volume.unbind(1))
	music_vol_slider.value_changed.connect(update_music_volume.unbind(1))

func update_difficulty() -> void:
	GameManager.difficulty_level = floori(difficulty_slider.value) as GameManager.Difficulty

func update_master_volume() -> void:
	GameManager.master_volume = master_vol_slider.value

func update_music_volume() -> void:
	GameManager.music_volume = music_vol_slider.value
