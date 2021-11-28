extends Area2D

onready var questionMark = get_node("QuestionMark")

func _input(event):
	if event.is_action_pressed("game_usage") and len (get_overlapping_bodies())>0:
		find_and_use_dialogue()
		
func find_and_use_dialogue():
	var dialogue_player = get_node_or_null("DialoguePlayer")
	print(dialogue_player)
	if dialogue_player:
		dialogue_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if len (get_overlapping_bodies())>0:
		questionMark.visible = true
	else:
		questionMark.visible = false
	
