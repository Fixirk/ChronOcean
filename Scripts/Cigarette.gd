extends Node

onready var game = get_node("/root/CigaretteGameScene")

func _on_Cigarette_body_entered(body):
	
	if body.name == "Ashtray":
		self.queue_free()
		game.increase_score()
	elif body.name == "Floor":
		self.queue_free()
		game.decrease_score()
