extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 80


var motion = Vector2()
var facing_right = true



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	motion.y += GRAVITY
	
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
		
	if facing_right == true:
		$Pngegg.scale.x = 1
	else:
		$Pngegg.scale.x = -1
	if Input.is_action_pressed("right"):
		motion.x = MAXSPEED
		facing_right =true
		$AnimationPlayer.play("go left")
	elif Input.is_action_pressed("left"):
		motion.x = -MAXSPEED
	else:
		motion.x =0
	
	motion = move_and_slide(motion,UP)
