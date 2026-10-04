class_name DifficultyLabel
extends Label

func update_label_text(difficulty: Game.Difficulty) -> void:
	match difficulty:
		Game.Difficulty.EASY:
			text = "Easy"
		Game.Difficulty.NORMAL:
			text = "Normal"
		Game.Difficulty.HARD:
			text = "Hard"
