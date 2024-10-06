extends CharacterBody2D




const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var in_door

func _ready():
	EventBus.connect("player_entered_door", Callable(self, "_on_player_entered_door"))
	EventBus.connect("player_exited_door", Callable(self, "_on_player_exited_door"))

func _on_player_entered_door(to_level):
	print("entered door. To Level: ", to_level	)

func _on_player_exited_door():
	print("ExitedDoor")
	

func _process(delta):
	
	if in_door:
		$UP.visible = true
	else:
		$UP.visible = false


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()




func _on_station_loaded(door_position: Vector2):
	# Set the player's position to the door's position
	global_position = door_position
