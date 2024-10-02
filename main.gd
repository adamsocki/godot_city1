extends Node

#@export var startingMapScene
var levelManager : LevelManager
var currentLevel

func _ready():
	GridManager.init_grid_manager()
	StationManager.init_station_manager()
	SubwayManager.init_subway_manager(2)
	
	
	
	
	levelManager = get_node("LevelManager") as LevelManager
	var player = get_node("Player")

	if levelManager != null and player != null:
		levelManager.connect("level_loaded", Callable(player, "_on_level_loaded"))
		levelManager.InitLevel()
		
	else:
		print("LevelManager or Player node not found!")
	
	

func _process(delta):
	GridManager.update_grid_manager(delta)
	StationManager.update_station_manager(delta)
	SubwayManager.update_subway_manager(delta)
