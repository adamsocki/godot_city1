class_name LevelManager extends Node


signal level_loaded(door_global_position: Vector2)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func MyInit():
	
	print("MyInitLevel man")
	
func InitLevel():
	var firstLevel = load("res://tileMap/1.tscn")
	var station = firstLevel.instantiate()
	var station_door  = station.get_node("door") as Door
	if (station_door != null):
		#var player = load("res://scenes/station.tscn")
		emit_signal("level_loaded", station_door.global_position)
		
		print("doorfound")
	add_child(station)
