extends Node2D

const positions = [
	Vector2(142, -20),
	Vector2(284, -20),
	Vector2(426, -20),
	Vector2(568, -20),
	Vector2(710, -20),
	Vector2(852, -20),
	Vector2(994, -20),
	Vector2(1136, -20),
]

func _ready():
	spawn_cigarettes()

func spawn_cigarettes():
	print("spawn")
