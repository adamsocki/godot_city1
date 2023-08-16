extends Node2D




func init_grid_display():
	for station in Global.grid.station_list:
		print(station.grid_location)
		var station_load = load("res://scenes/station.tscn").instantiate()
		station_load.set_station_data(station)
		
#		station_load.name = station.station_name
#		station_load.grid_location = station.grid_location
#		station_load.transform.position = station.grid_position
		add_child(station_load)
	


func update_grid_display(delta):
	var children = get_children()
	for child in children:
		var station_data = child.get_station_data()
		child.position.x = station_data.grid_location.x * 4
		child.position.y = station_data.grid_location.y * 4
		
		print("cs")
	pass
