extends Sprite

const MAX_SPEED = 5
const MAX_ANGLE = 75
const FORCE = 2500
const HEIGHT_THRESHOLD = 150

onready var ashtrayNode = get_node("/root/CigaretteGameScene/Ashtray")

var remainingJumps = 3
var remainingDowns = 1

func _physics_process(_delta):
	if Input.is_action_pressed("right"):
		if (self.rotation_degrees < MAX_ANGLE):
			self.rotation_degrees += MAX_SPEED
	elif Input.is_action_pressed("left"):
		if (self.rotation_degrees > -MAX_ANGLE):
			self.rotation_degrees -= MAX_SPEED
	
	if Input.is_action_just_pressed("down") and remainingDowns > 0:
		downAshtray()
	
	if Input.is_action_just_pressed("fire") and ashtrayNode.position.y > HEIGHT_THRESHOLD and remainingJumps > 0:
		fireAshtray()
		
func downAshtray():
	ashtrayNode.set_linear_velocity(Vector2.ZERO)
	ashtrayNode.apply_impulse(Vector2.ZERO, Vector2(0, FORCE))
	remainingDowns -= 1

func fireAshtray():
	ashtrayNode.apply_impulse(Vector2.ZERO, Vector2(sin(deg2rad(self.rotation_degrees)) * FORCE, - cos(deg2rad(self.rotation_degrees)) * FORCE))
	remainingJumps -= 1

func _on_Ashtray_body_entered(body):
	if body.name == "Floor":
		remainingJumps = 2
		remainingDowns = 1
