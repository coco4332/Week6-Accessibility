class_name DifficultyLabel
extends Label

func update_label_text(difficulty: GameManager.Difficulty) -> void:
	match difficulty:
		GameManager.Difficulty.EASY:
			text = "Easy"
		GameManager.Difficulty.NORMAL:
			text = "Normal"
		GameManager.Difficulty.HARD:
			text = "Hard"
