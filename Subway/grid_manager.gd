extends Node


var Grid_Display_Scene

# Called when the node enters the scene tree for the first time.
func init_grid_manager():
	
	Global.grid = Grid.new(100,100)
	var grid_display_scene = load("res://scenes/Grid_Display.tscn").instantiate()
	grid_display_scene.name = "GridDisplay"
	add_child(grid_display_scene)
	Grid_Display_Scene = grid_display_scene
	
	# CREATE RANDOM STATIONS
	for a in 23:
		var new_station = Global.grid.generate_new_station()
#		stations.append(new_station)
#		print(new_station.grid_location)
	
	Grid_Display_Scene.init_grid_display()
	
	Global.grid.sort_pouplation_high_to_low()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_grid_manager(delta):
	
	Grid_Display_Scene.update_grid_display(delta)
	
