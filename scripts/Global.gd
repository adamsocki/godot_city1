extends Node


var current_level := 0
var next_level := 0

var from_level := 0
var to_level := 0

var last_level := 20
var game

var grid 

var init_place_player

# Called when the node enters the scene tree for the first time.
func _ready():
	init_place_player = true
	GameManager.init_game_manager()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	GameManager.update_game_manager(delta)



enum StationTypes
{
	SURFACE, ABOVE, BELOW
}
