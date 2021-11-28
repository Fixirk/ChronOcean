extends Node

func _on_Cigarette_body_entered(body):
	if body.name == "Ashtray":
		# delete cigarette
		# add score to player
		queue_free()
		

# action upon reaching floor
