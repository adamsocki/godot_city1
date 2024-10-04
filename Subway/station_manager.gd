extends Node


#var stations = []



func add_to_station_list(station : Station):
	Global.world.stations.append(station)
	Global.world.add_to_occupied_world_location(station.world_location)





# Called when the node enters the scene tree for the first time.
func init_station_manager():
	
	# CREATE RANDOM STATIONS
	for a in 12:
		var new_station = Tools.StationGenerator.generate_new_station()
		add_to_station_list(new_station)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_station_manager(delta):
	for station in Global.world.stations:
		pass
#		print(station.grid_location)
