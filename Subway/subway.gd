extends Node
class_name Subway


var number_of_stops
var line_color
var station_ids



func set_station(station_id: int):
	station_ids.append(station_id)




func top_five_pop_constructor():
	# Get Top Five most pop stations
	
	pass
 



func subway_line_constructor(type: int):
	match type:
		0:
			top_five_pop_constructor()
			pass
		1:
			pass
		_:
			pass




#func _init(stop_num: int):
func _init():
#	snumber_of_stops = stop_num
	line_color = Color(randf_range(0.0, 1.0), randf_range(0.0, 1.0), randf_range(0.0, 1.0), 1.0)
