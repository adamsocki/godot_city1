extends Node2D

var tile_map_path := "res://TileMap/"
enum {TILE_GROUND = 0, TILE_PLAYER = 1}
var NodeTileMap




# Called when the node enters the scene tree for the first time.
func _ready():
	Global.game = self
	
	
	MapLoad()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func MapLoad():
	var next_level = min(Global.level, Global.last_level)
	var tile_map = load(tile_map_path + str(next_level) + ".tscn").instantiate()
	tile_map.name = "TileMap"
	add_child(tile_map)
	NodeTileMap = tile_map
