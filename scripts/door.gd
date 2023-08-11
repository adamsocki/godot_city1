extends Area2D

@export var to_level : int











func _on_body_entered(body):
	if body != null and body.name == "Player":
		body.in_door = true
		print("IN")


func _on_body_exited(body):
	if body != null and body.name == "Player":
		body.in_door = false
		print("out")
		
