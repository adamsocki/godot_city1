extends Node2D



static func is_location_occupied(location_to_check : Vector2) -> bool:
	if Global.world.occupied_world_locations == null:
		return false
	else:
		for occupied_location in Global.world.occupied_world_locations:
			if occupied_location == location_to_check:
				return true
	return false




static func generate_new_station() -> Station:
	var to_create_station = true
	var station_location : Vector2
	while to_create_station:
		station_location.x = randi_range(0, Global.world.world_size_x)
		station_location.y = randi_range(0, Global.world.world_size_y)
		to_create_station = is_location_occupied(station_location)
	var generated_station = Station.new("name",station_location)
	
	
	return generated_station





static func place_component(scenePath: String, componentPosition: Vector2, parent: Node):
	var scene = load(scenePath)
	var instance = scene.instantiate()
	instance.position = componentPosition
	parent.add_child(instance)
	
	




# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 10:
		#place_component("res://Station/FloorTile.tscn", Vector2(100 + (i * 32), 500), self)
		pass


static func test():
	print("test tool.levelGen")
