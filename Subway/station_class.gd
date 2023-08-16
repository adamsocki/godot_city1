extends Node
class_name Station

var station_name : String

var grid_location : Vector2


var nearby_population : int
var nearby_employment : int




func _init(name_for_station: String, grid: Vector2):
	grid_location = grid
	station_name = name_for_station
	generate_demographics()



func generate_demographics():
	# Random Population Employment Data
	nearby_population = randi_range(30, 2000)
	nearby_employment = randi_range(30, 2000)



