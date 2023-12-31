extends Node2D




func init_grid_display():
	
	# RESIZE MAP_VIEWER TO MAP_SIZE->COLOR_RECT
	$Map_Viewer.size = $Map_Viewer/Map_Size.get_size()
	var scaleFactor = Vector2($Map_Viewer.get_size().x / Global.grid.grid_size_x, $Map_Viewer.get_size().y / Global.grid.grid_size_y)
	
	# LOAD AND SET STATIONS
	for station in Global.grid.station_list:
		
		# SET STATION TO GRID
		var station_load_to_map = load("res://scenes/station.tscn").instantiate()
		station_load_to_map.set_station_data(station)
		
		#SET STATION POSITION ON MAP_GUI
		var scaledVector = Vector2(station.grid_location.x * scaleFactor.x, station.grid_location.y * scaleFactor.y)
		station_load_to_map.position = scaledVector
		
		station_load_to_map.get_child(0).size.x *= station.nearby_population / 300
		station_load_to_map.get_child(0).size.y *= station.nearby_population / 300
		# ADD STATION AS CHILDREN
		$Map_Viewer.add_child(station_load_to_map)

	

func _draw():
	var scaleFactor = Vector2($Map_Viewer.get_size().x / Global.grid.grid_size_x, $Map_Viewer.get_size().y / Global.grid.grid_size_y)
	
	var vec1_line = Vector2((Global.grid.pop_pair_1[0].grid_location.x * scaleFactor.x) + $Map_Viewer.get_position().x,(Global.grid.pop_pair_1[0].grid_location.y * scaleFactor.y) + $Map_Viewer.get_position().y)
	var vec2_line = Vector2((Global.grid.pop_pair_1[1].grid_location.x * scaleFactor.x) + $Map_Viewer.get_position().x,(Global.grid.pop_pair_1[1].grid_location.y * scaleFactor.y) + $Map_Viewer.get_position().y)
	print(vec1_line)
	print(vec2_line)
	
	draw_line(vec1_line, vec2_line, Color.ALICE_BLUE, 10)
func update_grid_display(delta):
	pass
	
#	var children = get_children()
#	for child in children:
#		var station_data = child.get_station_data()
##		child.position.x = station_data.grid_location.x * 4
##		child.position.y = station_data.grid_location.y * 4
		
#		print("cs")
	
