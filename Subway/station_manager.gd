extends Node


var stations = []



# Called when the node enters the scene tree for the first time.
func init_station_manager():
	stations.resize(3)
	for a in 3:
		var new_station = Global.grid.generate_new_station()
		stations.append(new_station)
#		print(new_station.grid_location)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_station_manager(delta):
	for station in stations:
		pass
#		print(station.grid_location)
