extends RigidBody2D

onready var arrowNode = get_node("/root/CigaretteGameScene/Arrow")

func _integrate_forces(state):
	rotation_degrees = 0
