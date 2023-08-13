extends Area2D

@export var to_level : int


var body_reference = null



func _process(delta):
	if body_reference != null:
		if body_reference.name == "Player" and body_reference.in_door:
			if Input.is_action_just_pressed("input_up"):
				# SET LEVEL CHANGES
				Global.from_level = Global.current_level
				Global.current_level = to_level
				
				get_node("/root/Game").ReOpenLevel()




func _on_body_entered(body):
	if body != null and body.name == "Player":
		body.in_door = true
		body_reference = body


func _on_body_exited(body):
	if body != null and body.name == "Player":
		body.in_door = false
		body_reference = body
