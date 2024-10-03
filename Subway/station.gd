extends Node
class_name Station


#@export var station_data : Station


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


var station_name : String

var world_location : Vector2


var nearby_population : int
var nearby_employment : int

var roomCount: int
var rooms : Array[Room]


func _init(name_for_station: String, pos: Vector2):
	world_location = pos
	station_name = name_for_station
	generate_demographics()



func generate_demographics():
	# Random Population Employment Data
	nearby_population = randi_range(30, 2000)
	nearby_employment = randi_range(30, 2000)



#func set_station_data(data: Station):
	#station_data = data


#func get_station_data():
	#return station_data
