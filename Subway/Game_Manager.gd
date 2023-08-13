extends Node




# Called when the node enters the scene tree for the first time.
func init_game_manager():
	SubwayManager.init_subway_manager(2)
	GridManager.init_grid_manager()
	StationManager.init_station_manager()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_game_manager(delta):
	SubwayManager.update_subway_manager(delta)
	GridManager.update_grid_manager(delta)
	StationManager.update_station_manager(delta)
	

