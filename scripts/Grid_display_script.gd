extends Node2D




func init_grid_display():
	
#	var colorrect_size =  
	$Map_Viewer.size = $Map_Viewer/Map_Size.get_size()
	# LOAD AND SET STATIONS
	for station in Global.grid.station_list:
		
		# SET STATION TO GRID
		var station_load = load("res://scenes/station.tscn").instantiate()
		station_load.set_station_data(station)
		
		#SET STATION POSITIONS
		var scaleFactor = Vector2($Map_Viewer.get_size().x / Global.grid.grid_size_x, $Map_Viewer.get_size().y / Global.grid.grid_size_y)
		var scaledVector = Vector2(station.grid_location.x  * scaleFactor.x, station.grid_location.y * scaleFactor.y)

#		var windowSize = Vector2($Map_Viewer.get_size().x, $Map_Viewer.get_size().y)
		station_load.position = scaledVector
#		station_load.position = station_load.position
		
		print(station.grid_location)
		print(station_load.position)

		
		
#		station_load.position.x = station.grid_location.x / $Map_Viewer.get_size().x
#		station_load.position.y = station.grid_location.y / $Map_Viewer.get_size().y
		
#		station_load.get_child(0).size.x /= $Map_Viewer.get_size().x
#		station_load.get_child(0).size.y /= $Map_Viewer.get_size().y		
		
		# ADD STATION AS CHILDREN
		$Map_Viewer.add_child(station_load)
#		print($Map_Viewer.get_size())



func update_grid_display(delta):
	pass
	
#	var children = get_children()
#	for child in children:
#		var station_data = child.get_station_data()
##		child.position.x = station_data.grid_location.x * 4
##		child.position.y = station_data.grid_location.y * 4
		
#		print("cs")
	
