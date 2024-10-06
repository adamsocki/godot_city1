extends Node2D


func init_world_display():
	
	# RESIZE MAP_VIEWER TO MAP_SIZE->COLOR_RECT
	$Map_Viewer.size = $Map_Viewer/Map_Size.get_size()
	var scaleFactor = Vector2($Map_Viewer.get_size().x / Global.world.world_size_x, $Map_Viewer.get_size().y / Global.world.world_size_y)
	
	# LOAD AND SET STATIONS
	for station in Global.world.stations:
		
		# SET STATION TO WORLD
		var station_display_load_to_map = load("res://scenes/station_display.tscn").instantiate()
		station_display_load_to_map.name = "pizza"
		
		#SET STATION POSITION ON MAP_GUI
		var scaledVector = Vector2(station.world_location.x * scaleFactor.x, station.world_location.y * scaleFactor.y)
		station_display_load_to_map.position = scaledVector
		
		station_display_load_to_map.get_child(0).size.x *= station.nearby_population / 300
		station_display_load_to_map.get_child(0).size.y *= station.nearby_population / 300
		# ADD STATION AS CHILDREN
		$Map_Viewer.add_child(station_display_load_to_map)

func _draw():
	var scaleFactor = Vector2($Map_Viewer.get_size().x / Global.world.world_size_x, $Map_Viewer.get_size().y / Global.world.world_size_y)
	
	var vec1_line = Vector2((Global.world.pop_pair_1[0].world_location.x * scaleFactor.x) + $Map_Viewer.get_position().x,(Global.world.pop_pair_1[0].world_location.y * scaleFactor.y) + $Map_Viewer.get_position().y)
	var vec2_line = Vector2((Global.world.pop_pair_1[1].world_location.x * scaleFactor.x) + $Map_Viewer.get_position().x,(Global.world.pop_pair_1[1].world_location.y * scaleFactor.y) + $Map_Viewer.get_position().y)
	print(vec1_line)
	print(vec2_line)
	
	draw_line(vec1_line, vec2_line, Color.ALICE_BLUE, 10)

func update_world_display(delta):
	pass
