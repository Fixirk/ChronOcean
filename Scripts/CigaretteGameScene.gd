extends Node2D

var player = preload("res://Prefab/Cigarette.tscn")

onready var timer = get_node("/root/CigaretteGameScene/Timer")

const MINIMAL_CIGARETTE_AMOUNT = 1
const MAXIMAL_CIGARETTE_AMOUNT = 4

const INITIAL_INTERVAL = 5.0
const INTERVAL_REDUCTION_RANGE_MIN = 0.05
const INTERVAL_REDUCTION_RANGE_MAX = 0.25
const MINIMAL_INTERVAL = 2.5
var currentInterval = INITIAL_INTERVAL

var rng = RandomNumberGenerator.new()
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

var score = 0

func _ready():
	rng.randomize()
	spawn_cigarettes(2)
	
func spawn_one_cigarette(position):
	var playerInstance = player.instance()
	playerInstance.position = position
	add_child(playerInstance)
	
	playerInstance.apply_impulse(Vector2.ZERO, Vector2(rng.randf_range(-1, 1) * 10, rng.randf_range(-1, 1) * 10))

func spawn_cigarettes(nb_of_cigarettes):
	var used_positions = []
	for n in nb_of_cigarettes:
		var is_used_position = 0
		var i = 0
		
		while is_used_position >= 0:
			i  = rng.randi_range(0, positions.size() - 1)
			is_used_position = used_positions.find(i)
		
		used_positions.append(i)
		
		var position = positions[i]
		spawn_one_cigarette(position)

func _on_Timer_timeout():
	currentInterval -= rng.randf_range(INTERVAL_REDUCTION_RANGE_MIN, INTERVAL_REDUCTION_RANGE_MAX)
	
	if (currentInterval < MINIMAL_INTERVAL):
		currentInterval = MINIMAL_INTERVAL

	timer.set_wait_time(currentInterval)
	
	spawn_cigarettes(rng.randi_range(MINIMAL_CIGARETTE_AMOUNT, MAXIMAL_CIGARETTE_AMOUNT))

func increase_score():
	score += 1
	print(score)
	
func decrease_score():
	score -= 1
	print(score)
