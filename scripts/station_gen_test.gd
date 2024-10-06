extends Node
#class_name StationGenerator
#
## Reference to the TileSet resource
#@export var station_tile_set: TileSet
#
## Station size limits
#@export var min_width: int = 10
#@export var max_width: int = 20
#@export var min_height: int = 5
#@export var max_height: int = 10
#
## Tile IDs (assuming you know the IDs or names in your TileSet)
#const TILE_FLOOR = 0
#const TILE_WALL = 1
#const TILE_PLATFORM = 2
#const TILE_TRACK = 3
#const TILE_ENTRANCE = 4


#func _init():
	#var station_tile_map = generate_station(Vector2(10,10))
	#if station_tile_map != null:
		#add_child(station_tile_map)

#func generate_station(station_location: Vector2) -> TileMap:
	## Randomly determine station dimensions
	#var width = randi_range(min_width, max_width)
	#var height = randi_range(min_height, max_height)
#
	## Create a new TileMap node
	#var tile_map = TileMap.new()
	#tile_map.tile_set = station_tile_set
	##tile_map.cell_size = Vector2(32, 32)  # Adjust based on your tile size
#
	## Generate the station layout
	#for x in range(width):
		#for y in range(height):
			#var tile_position = Vector2(x, y)
			## Place walls around the perimeter
			#if x == 0 or x == width - 1 or y == 0 or y == height - 1:
				#tile_map.set_cell(0, tile_position, TILE_WALL)
			#else:
				#tile_map.set_cell(0, tile_position, TILE_FLOOR)
#
	## Add platforms and tracks
	## Assuming platforms are on one side and tracks next to them
	#var platform_y = height / 2
	#for x in range(1, width - 1):
		#tile_map.set_cell(0, Vector2(x, platform_y), TILE_PLATFORM)
		#tile_map.set_cell(0, Vector2(x, platform_y + 1), TILE_TRACK)
#
	## Add entrance/exit
	#tile_map.set_cell(0, Vector2(width / 2, 0), TILE_ENTRANCE)  # Entrance at the top center
	#tile_map.set_cell(0, Vector2(width / 2, height - 1), TILE_ENTRANCE)  # Exit at the bottom center
#
	## Position the TileMap in the world
	#tile_map.position = station_location * Vector2(32, 32) * Vector2(1, 1)  # Adjust as needed
#
	#return tile_map
