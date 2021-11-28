extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 220

var motion = Vector2()
onready var _animated_sprite = $AnimatedSprite
onready var facing_right = !$AnimatedSprite.is_flipped_h()


func _ready():
	# Called when the node enters the scene tree for the first time.
	pass # Replace with function body.

func _physics_process(delta):
	# Gravité
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
		
	# Gestion vélocité et direction
	if Input.is_action_pressed("right"):
		motion.x = MAXSPEED
		facing_right = true
	elif Input.is_action_pressed("left"):
		motion.x = -MAXSPEED
		facing_right = false		
	else:
		motion.x =0	
	
	motion = move_and_slide(motion,UP)	
	
	# Gestion animation
	if Input.is_action_pressed("right"):
		_animated_sprite.play("walk")
	elif Input.is_action_pressed("left"):
		_animated_sprite.play("walk")		
	else:
		_animated_sprite.play("idle")
	_animated_sprite.set_flip_h(!facing_right)
