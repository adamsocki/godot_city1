extends Node
class_name World


var world_size_x
var world_size_y

#var occupied_world_locations 
var occupied_world_locations: Array[Vector2] = []
var stations = [] 
#stations

var station_list_pop_sort = []
var pop_pair_1 = []

var station_list_emp_sort = []


#func is_location_occupied(location_to_check : Vector2) -> bool:
	#var is_occupied = false
	#if occupied_world_locations == null:
		#return is_occupied
	#else:
		#for occupied_location in occupied_world_locations:
			#if occupied_location == location_to_check:
				#is_occupied = true
	#return is_occupied
#
#func generate_new_station() -> Station:
	#var to_create_station = true
	#var station_location : Vector2
	#while to_create_station:
		#station_location.x = randi_range(0, world_size_x)
		#station_location.y = randi_range(0, world_size_y)
		#to_create_station = is_location_occupied(station_location)
	#var generated_station = Station.new("name",station_location)
	#add_to_station_list(generated_station)
	#return generated_station


func add_to_occupied_world_location(world_vector : Vector2):
	occupied_world_locations.append(world_vector)
	pass
	
#func add_to_station_list(station : Station):
##	if station_list.count() == 0:
##		station_list.resize(100)
	#station_list.append(station)
#


func sort_pouplation_high_to_low():
	station_list_pop_sort = stations.duplicate()
	for i in range(station_list_pop_sort.size()):
		for j in range(i + 1, station_list_pop_sort.size()):
			if (station_list_pop_sort[i].nearby_population < station_list_pop_sort[j].nearby_population):
				var temp = station_list_pop_sort[i]
				station_list_pop_sort[i] = station_list_pop_sort[j]
				station_list_pop_sort[j] = temp
				
	for i in station_list_pop_sort.size():
		print(station_list_pop_sort[i].nearby_population)
	for i in stations.size():
		print(stations[i].nearby_population)


func calc_max_distance_by_top_number(num: int):
	var greatest_distance = 0
	var greatest_pair = null
	var count = 0
	for i in num:
		for j in num:
			if i != j:
				var current_vector = station_list_pop_sort[i].world_location
				var next_vector = station_list_pop_sort[j].world_location
				
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
	print(greatest_pair[0].world_location)
	print(greatest_pair[1].world_location)
	print(greatest_distance)
	pop_pair_1 = greatest_pair.duplicate()
#	draw_line(greatest_pair[0].grid_location, greatest_pair[1].grid_location)
#	print()

func sort_employment_high_to_low():
	pass

	


func points_within_XY_of_line(top_num: int, make_connection: bool) -> bool:
	var is_within_XY = false
	
	for i in top_num:
		if station_list_pop_sort[i].world_location.x > pop_pair_1[0].world_location.x and station_list_pop_sort[i].world_location.x <  pop_pair_1[1].world_location.x:
			if station_list_pop_sort[i].world_location.y >  pop_pair_1[0].world_location.y and station_list_pop_sort[i].world_location.y < pop_pair_1[1].world_location.y:
				is_within_XY = true
	
	if is_within_XY:
		if make_connection:
			pass
			
	return is_within_XY




func _init(x: int, y: int):
	world_size_x = x
	world_size_y = y
	
