extends Node


#var stations = []


signal level_loaded(door_global_position: Vector2)

func add_to_station_list(station: Station):
	Global.world.stations.append(station)
	Global.world.add_to_occupied_world_location(station.world_location)




# Called when the node enters the scene tree for the first time.
func init_station_manager():
	var StationScene = load("res://scenes/station.tscn")
	# CREATE RANDOM STATIONS
	for a in 12:
		var new_station = Tools.StationGenerator.generate_new_station()
		#var newStationScene = StationScene.instantiate()
		add_to_station_list(new_station)
		#newStationScene.set_script(new_station)
		#newStationScene
		#add_child(new_station)


func load_station(stationID: int, player: Node):
	var firstLevel = Global.world.stations[stationID]
	#var station = firstLevel.instantiate()
	#var firstLevel = load("res://tileMap/1.tscn")
	#var station = firstLevel.instantiate()
	var station_door  = firstLevel.get_node("door") as Door
	if (station_door != null):
		##var player = load("res://scenes/station.tscn")
		emit_signal("level_loaded", station_door.global_position)
		#
		#print("doorfound")
	#add_child(station)
	var current_scene = get_tree().current_scene
	if current_scene:
		current_scene.queue_free()
	add_child(firstLevel)
	#get_tree().root.add_child(firstLevel)
	#get_tree().current_scene = firstLevel
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_station_manager(delta):
	for station in Global.world.stations:
		pass
#		print(station.grid_location)
