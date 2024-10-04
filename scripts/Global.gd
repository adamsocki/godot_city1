extends Node

class Point2:
	var x: float
	var y: float

var current_level := 0
var next_level := 0

var from_level := 0
var to_level := 0

var last_level := 20
var game

var world 

var init_place_player

func _ready():
	#init_place_player = true
	pass
	
	
	

func _process(delta):
	pass



enum StationTypes
{
	SURFACE, ABOVE, BELOW
}
