extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#var active = false
# Called when the node enters the scene tree for the first time.
func _ready():
#	connect('body_entered',self,'_on_NPC_body_entered')
#	connect('body_entered',self,'_on_NPC_body_exited')

	$AnimationPlayer.play("questionmark")
	pass
 # Replace with function body.

#func _on_NPC_body_entered(body):
#	if body.name == 'Player':
#		active= true
		
#func _on_NPC_body_exited(body):
#	if body.name == 'Player':
#		active= false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
