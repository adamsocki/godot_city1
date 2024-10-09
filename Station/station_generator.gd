extends Node2D


static var subway_station_names = [
	"Maplewood Junction",
	"Cedar Heights",
	"Pinebrook",
	"Willowdale",
	"Birch Park",
	"Oakridge",
	"Elmwood",
	"Aspen Grove",
	"Spruce Meadows",
	"Sycamore Central",
	"Hawthorne Point",
	"Magnolia Lane",
	"Chestnut Grove",
	"Redwood Terminal",
	"Alderwood",
	"Bluebell Gardens",
	"Foxglove Station",
	"Goldenrod Park",
	"Lavender Heights",
	"Thyme Square",
	"Juniper Crossing",
	"Cloverfield",
	"Sunflower Plaza",
	"Ivybridge",
	"Heather Valley",
	"Rosewood",
	"Cypress Hill",
	"Laurel Ridge",
	"Fernwood",
	"Poppyfield"
]


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

	var stationScene = load("res://scenes/station.tscn")

	var generated_station = Station.new("name",station_location)
	
	stationScene.set_script(generated_station)
	#var instance = stationScene.instantiate()
	var doorLocation = Vector2(randi_range(0, Global.stationSize.x), randi_range(0,Global.stationSize.y))
	#var doorReference = place_component("res://scenes/door.tscn", doorLocation, generated_station)
	var scene = load("res://scenes/door.tscn")
	var instance = scene.instantiate()
	instance.position = doorLocation
	generated_station.add_child(instance)
	
	var doorSizeCollision : Vector2
	
	if (instance.get_node("CollisionShape2D").shape is RectangleShape2D):
		doorSizeCollision = instance.get_node("CollisionShape2D").shape.extents

	const tot_i = 10
	for i in tot_i:
		
		var floorTileScene = load("res://Station/FloorTile.tscn")
			
		var floorTileSceneInstance = floorTileScene.instantiate()
		if i == 0:
			floorTileSceneInstance.get_node("leftEdgeBlock").disabled = false
		if i == tot_i - 1:
			floorTileSceneInstance.get_node("rightEdgeBlock").disabled = false
			
		if (floorTileSceneInstance.get_node("CollisionShape2D").shape is RectangleShape2D):
			var floorTileSceneInstanceSize = floorTileSceneInstance.get_node("CollisionShape2D").shape.extents
			floorTileSceneInstance.position = Vector2(doorLocation.x + (i * floorTileSceneInstanceSize.x ), doorLocation.y +  (floorTileSceneInstanceSize.y * 2))
		generated_station.add_child(floorTileSceneInstance)
	
	
	generated_station.name = get_random_name(subway_station_names)
	
	return generated_station



#static func place_component(scenePath: String) -> Node2D:
	#var scene = load(scenePath)
	#var instance = scene.instantiate()
	##instance.position = componentPosition
	##parent.add_child(instance)
	#return instance
	
	

#func place_level_components():
	#for i in 10:
		##place_component("res://Station/FloorTile.tscn", Vector2(100 + (i * 32), 500), self)
		#pass



## Called when the node enters the scene tree for the first time.
#func _ready():
	#for i in 10:
		##place_component("res://Station/FloorTile.tscn", Vector2(100 + (i * 32), 500), self)
		#pass
static func get_random_name(names: Array) -> String:
	if names.size() == 0:
		return ""
	var random_index = randi() % names.size()
	return names[random_index]




static func test():
	print("test tool.levelGen")
