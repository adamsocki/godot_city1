extends Node
class_name Station

var station_name : String

var grid_location : Vector2






func _init(name_for_station: String, grid: Vector2):
	grid_location = grid
	station_name = name_for_station



