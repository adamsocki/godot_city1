extends Node


@export var station_data : Station


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_station_data(data: Station):
	station_data = data


func get_station_data():
	return station_data
