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

var currentViewportSize : Vector2

var stationSize : Vector2
var stationSizeWidth
var stationSizeHeight

func _ready():
	#init_place_player = true 
	stationSize = get_viewport().size

	#stationSizeHeight = ProjectSettings.get_setting("display/window/size/height")
	pass
	
	
	

func _process(delta): 
	
	currentViewportSize = get_viewport().size
	pass



enum StationTypes
{
	SURFACE, ABOVE, BELOW
}
