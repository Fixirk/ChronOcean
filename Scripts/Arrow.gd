extends Sprite

const MAX_SPEED = 3
const MAX_ANGLE = 75
const FORCE = 4000
const HEIGHT_THRESHOLD = 150

onready var ashtrayNode = get_node("/root/CigaretteGameScene/Ashtray")

func _physics_process(_delta):
	if Input.is_action_pressed("right"):
		if (self.rotation_degrees < MAX_ANGLE):
			self.rotation_degrees += MAX_SPEED
	elif Input.is_action_pressed("left"):
		if (self.rotation_degrees > -MAX_ANGLE):
			self.rotation_degrees -= MAX_SPEED
	
	if Input.is_action_just_pressed("fire") and ashtrayNode.position.y > HEIGHT_THRESHOLD:
		fireAshtray()

func fireAshtray():
	ashtrayNode.apply_impulse(Vector2(0, 0), Vector2(sin(deg2rad(self.rotation_degrees)) * FORCE, - cos(deg2rad(self.rotation_degrees)) * FORCE))
