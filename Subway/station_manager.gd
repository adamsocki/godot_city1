extends Node


#var stations = []



func add_to_station_list(station : Station):
#	if station_list.count() == 0:
#		station_list.resize(100)
	Global.world.stations.append(station)
	Global.world.add_to_occupied_world_location(station.world_location)



func is_location_occupied(location_to_check : Vector2) -> bool:
	if Global.world.occupied_world_locations == null:
		return false
	else:
		for occupied_location in Global.world.occupied_world_locations:
			if occupied_location == location_to_check:
				return true
	return false

func generate_new_station() -> Station:
	var to_create_station = true
	var station_location : Vector2
	while to_create_station:
		station_location.x = randi_range(0, Global.world.world_size_x)
		station_location.y = randi_range(0, Global.world.world_size_y)
		to_create_station = is_location_occupied(station_location)
	var generated_station = Station.new("name",station_location)
	add_to_station_list(generated_station)
	return generated_station


# Called when the node enters the scene tree for the first time.
func init_station_manager():
	# create all stations
	# CREATE RANDOM STATIONS
	for a in 12:
		var new_station = generate_new_station()
		
		
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_station_manager(delta):
	for station in Global.world.stations:
		pass
#		print(station.grid_location)
