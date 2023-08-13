extends Node

#@export var num_of_lines : int

# Called when the node enters the scene tree for the first time.
func init_subway_manager(num_of_lines):
	for num in num_of_lines:
		print(num)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_subway_manager(delta):
	pass
