extends CharacterBody3D


const SPEED = 25.0
const JUMP_VELOCITY = 50

# Ajoutez ces propriétés pour le contrôle de la caméra
var mouse_sensitivity = 0.3
var pitch = 0.0
var yaw = 0.0
var show_cursor = false

@onready var under_water = $Control/UnderWater
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		# Mettre à jour la rotation de la caméra en fonction des mouvements de la souris
		yaw -= event.relative.x * mouse_sensitivity
		pitch -= event.relative.y * mouse_sensitivity

		# Limiter l'angle de pitch pour éviter les rotations excessives
		pitch = clamp(pitch, -89.0, 89.0)

		# Appliquer les rotations à la caméra
		$Camera3D.rotation_degrees = Vector3(pitch, yaw, 0.0)
	if event is InputEventKey:
		if Input.is_action_just_pressed("pause"):
			show_cursor = not show_cursor
			if show_cursor:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			else:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Vector2()
	input_dir.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_dir.y = Input.get_action_strength("down") - Input.get_action_strength("up")

	var camera_transform = $Camera3D.global_transform
	var camera_basis = camera_transform.basis

	var direction = camera_basis.z * input_dir.y + camera_basis.x * input_dir.x
	direction.y = 0
	direction = direction.normalized()

	if direction.length() > 0:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	get_screen_size()

func get_screen_size() -> Vector2:
	var size = DisplayServer.screen_get_size()
	under_water.set_size(size)
	if $".".global_transform.origin.y < 0:
		under_water.color = Color(0,255,255,0.5)
	else:
		under_water.color = Color(0,0,0,0)
	return size
	
