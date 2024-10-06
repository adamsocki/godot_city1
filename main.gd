extends Node

#@export var startingMapScene
var levelManager : LevelManager
var currentLevel

func _ready():
	
	## LOGIC  
	WorldManager.init_world_manager()
	StationManager.init_station_manager()
	SubwayManager.init_subway_manager(2)
	
	var player = get_node("Player")
	if player != null:
		StationManager.connect("station_loaded", Callable(player, "on_station_loaded"))
		
		
	#levelManager = get_node("LevelManager") as LevelManager
	#var player = get_node("Player")
	StationManager.load_station(0, player)
	
	
#
	#if levelManager != null and player != null:
		#levelManager.connect("level_loaded", Callable(player, "_on_level_loaded"))
		#levelManager.InitLevel()
	#else:
		#print("LevelManager or Player node not found!")
		
	## RENDERING  
	WorldManager.init_world_display()

func _process(delta):
	
	WorldManager.update_world_manager(delta)
	StationManager.update_station_manager(delta)
	SubwayManager.update_subway_manager(delta)
	
	
	
	
	WorldManager.update_world_display(delta)
