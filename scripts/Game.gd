extends Node2D

var tile_map_path := "res://TileMap/"
enum {TILE_DOOR = 0, TILE_GROUND = 4, TILE_PLAYER = 5}
var NodeTileMap

var ScenePlayer = load("res://scenes/player.tscn")
var SceneDoor = load("res://scenes/door.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.game = self
	
	MapLoad()
	MapStart()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("reload"):
		ReOpenLevel()


func MapLoad():
	var next_level = min(Global.level, Global.last_level)
	var tile_map = load(tile_map_path + str(next_level) + ".tscn").instantiate()
	tile_map.name = "TileMap"
	add_child(tile_map)
	NodeTileMap = tile_map


func MapStart():
	for pos in NodeTileMap.get_used_cells(0):
		var id = NodeTileMap.get_cell_source_id(0, pos)
		if id == TILE_GROUND:
			pass
		elif id == TILE_PLAYER:
			var player = id == TILE_PLAYER
			var inst = ScenePlayer.instantiate()
			inst.position = NodeTileMap.map_to_local(pos) + Vector2(4, 0)
			self.add_child(inst)
			NodeTileMap.set_cell(0, pos, -1) 
		elif id == TILE_DOOR:
			var door = id == TILE_DOOR
			var inst = SceneDoor.instantiate()
			inst.position = NodeTileMap.map_to_local(pos) + Vector2(4, 0)
			self.add_child(inst)
			NodeTileMap.set_cell(0, pos, -1)


func ReOpenLevel():
	get_tree().reload_current_scene()
