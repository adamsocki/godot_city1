extends Node2D

var tile_map_path := "res://TileMap/"
enum {TILE_DOOR = 0, TILE_GROUND = 4, TILE_PLAYER = 5}
var NodeTileMap

var ScenePlayer = load("res://scenes/player.tscn")
var SceneDoor = load("res://scenes/door.tscn")

var init_place_player = true

var from_door = 0


func _init():
	Global.game = self
	print("_init")
	

# Called when the node enters the scene tree for the first time.
func _ready():
	#Global.game = self
#	PlayerData.c
	print("_Game._ready")
	
	MapLoad()
	MapStart()
	if init_place_player:
		init_place_player = false
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
#	if Input.is_action_just_pressed("reload"):
#		ReOpenLevel()


func MapLoad():
	var next_level = min(Global.current_level, Global.last_level)
	var tile_map = load(tile_map_path + str(next_level) + ".tscn").instantiate()
	tile_map.name = "TileMap"
	add_child(tile_map)
	NodeTileMap = tile_map


func MapStart():
	var player_coded_as_tile = false
	var level_doors = {}
#	print('1')
	if !NodeTileMap.player_tile_placement and NodeTileMap.get_children() != null:
#		print('2')
		for child in NodeTileMap.get_children():
#			print('3')
			
			if child.is_in_group("door"):
#				print('4')
				
				if child.to_level == Global.from_level:
#					print('5')
					
					var inst = ScenePlayer.instantiate()
					inst.position = child.position
					self.add_child(inst)
					print(inst.position)
	
#				level_doors{child.to_level: level_doors.position}
#				level_doors.append(child.to_level, level_doors.pos#ition)
#	if place_player:
#		var inst = ScenePlayer.instantiate()
#		inst.position = child.position
#		print(inst.position)
	var door_array
	for pos in NodeTileMap.get_used_cells(0):
		var id = NodeTileMap.get_cell_source_id(0, pos)
		if id == TILE_GROUND:
			pass
		elif id == TILE_PLAYER and Global.init_place_player:
			print("from tile")
			var player = id == TILE_PLAYER
			var inst = ScenePlayer.instantiate()
			inst.position = NodeTileMap.map_to_local(pos) + Vector2(4, 0)
			self.add_child(inst)
			NodeTileMap.set_cell(0, pos, -1) 
			player_coded_as_tile = true
			Global.init_place_player = false
#		elif id == TILE_DOOR:
#
#			var door = id == TILE_DOOR
#			var inst = SceneDoor.instantiate()
#			inst.position = NodeTileMap.map_to_local(pos) + Vector2(4, 0)
#			self.add_child(inst)
#			NodeTileMap.set_cell(0, pos, -1)
#			if player_coded_as_tile:
#				pass
	
		
	

	

func ReOpenLevel():
	#get_tree().reload_current_scene()
	pass
