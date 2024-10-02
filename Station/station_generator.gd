extends Node2D


func place_component(scenePath: String, componentPosition: Vector2, parent: Node):
	var scene = load(scenePath)
	var instance = scene.instantiate()
	instance.position = componentPosition
	parent.add_child(instance)
	




# Called when the node enters the scene tree for the first time.
func _ready():
	
	for i in 10:
		place_component("res://Station/FloorTile.tscn", Vector2(100 + (i * 32), 500), self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
