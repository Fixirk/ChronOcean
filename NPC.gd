extends Area2D

func _input(event):
	if event.is_action_pressed("game_usage") and len (get_overlapping_bodies())>0:
		find_and_use_dialogue()
		
func find_and_use_dialogue():
	var dialogue_player = get_node_or_null("DialoguePlayer")
	
	if dialogue_player:
		dialogue_player.play()

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
