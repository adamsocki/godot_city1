extends Node
class_name Grid


var grid_size_x
var grid_size_y

var occupied_grid_locations
var station_list = []


func is_location_occupied(location_to_check : Vector2) -> bool:
	var is_occupied = false
	if occupied_grid_locations == null:
		return is_occupied
	else:
		for occupied_location in occupied_grid_locations:
			if occupied_location == location_to_check:
				is_occupied = true
	return is_occupied

func generate_new_station() -> Station:
	var to_create_station = true
	var station_location : Vector2
	while to_create_station:
		station_location.x = randi_range(0, grid_size_x)
		station_location.y = randi_range(0, grid_size_y)
		to_create_station = is_location_occupied(station_location)
	var generated_station = Station.new("name",station_location)
	add_to_station_list(generated_station)
	return 


func add_to_occupied_grid_location(grid_vector : Vector2):
	occupied_grid_locations.append(grid_vector)
	pass
	
func add_to_station_list(station : Station):
#	if station_list.count() == 0:
#		station_list.resize(100)
	station_list.append(station)


func _init(x: int, y: int):
	grid_size_x = x
	grid_size_y = y
