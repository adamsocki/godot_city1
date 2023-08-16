extends Node


var Grid_Display_Scene

# Called when the node enters the scene tree for the first time.
func init_grid_manager():
#	Global.grid = Grid.instantiate(10,10)
#	Global.grid = Grid
	Global.grid = Grid.new(100,100)
	var grid_display_scene = load("res://scenes/Grid_Display.tscn").instantiate()
	grid_display_scene.name = "GridDisplay"
	add_child(grid_display_scene)
	Grid_Display_Scene = grid_display_scene

#	stations.resize(3)
	for a in 3:
		var new_station = Global.grid.generate_new_station()
#		stations.append(new_station)
#		print(new_station.grid_location)
	
	Grid_Display_Scene.init_grid_display()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_grid_manager(delta):
#	print(Global.grid.grid_size_x)
	Grid_Display_Scene.update_grid_display(delta)
	
	pass
