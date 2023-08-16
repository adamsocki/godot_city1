extends Node
class_name Grid


var grid_size_x
var grid_size_y

var occupied_grid_locations
var station_list = []

var station_list_pop_sort = []
var pop_pair_1 = []

var station_list_emp_sort = []



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



func sort_pouplation_high_to_low():
	station_list_pop_sort = station_list.duplicate()
	for i in range(station_list_pop_sort.size()):
		for j in range(i + 1, station_list_pop_sort.size()):
			if (station_list_pop_sort[i].nearby_population < station_list_pop_sort[j].nearby_population):
				var temp = station_list_pop_sort[i]
				station_list_pop_sort[i] = station_list_pop_sort[j]
				station_list_pop_sort[j] = temp
				
	for i in station_list_pop_sort.size():
		print(station_list_pop_sort[i].nearby_population)
	for i in station_list.size():
		print(station_list[i].nearby_population)


func calc_max_distance_by_top_number(num: int):
	var greatest_distance = 0
	var greatest_pair = null
	var count = 0
	for i in 5:
		for j in 5:
			if i != j:
				var current_vector = station_list_pop_sort[i].grid_location
				var next_vector = station_list_pop_sort[j].grid_location
				
				var distance = current_vector.distance_to(next_vector)
			
				if distance > greatest_distance:
					greatest_distance = distance
					greatest_pair = [station_list_pop_sort[i], station_list_pop_sort[j]]
				count += 1
				print(count)
				print(current_vector)
				print(next_vector)
				print(distance)
	
	print("final")
	print(greatest_pair[0].grid_location)
	print(greatest_pair[1].grid_location)
	print(greatest_distance)
	pop_pair_1 = greatest_pair.duplicate()
#	draw_line(greatest_pair[0].grid_location, greatest_pair[1].grid_location)
#	print()

func sort_employment_high_to_low():
	pass




func _init(x: int, y: int):
	grid_size_x = x
	grid_size_y = y
