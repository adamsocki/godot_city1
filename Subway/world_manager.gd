extends Node



var World_Display_Scene

func init_world_manager():
	
	Global.world = World.new(100,100)



func init_world_display():
	var world_display_scene = load("res://scenes/Grid_Display.tscn").instantiate()
	world_display_scene.name = "GridDisplay"
	add_child(world_display_scene)
	World_Display_Scene = world_display_scene
	Global.world.sort_pouplation_high_to_low()
	Global.world.calc_max_distance_by_top_number(3)
	World_Display_Scene.init_world_display()
	Global.world.points_within_XY_of_line(3, true)







func update_world_manager(delta):
	pass




func update_world_display(delta):
	World_Display_Scene.update_world_display(delta)
