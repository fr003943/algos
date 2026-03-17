extends CharacterBody3D

var speed: float = 5.0
var gravity: float = 30.0

func _physics_process(delta: float) -> void:
	# Apply gravity only; movement and rotation are controlled by external scripts.
	velocity.y -= gravity * delta
	move_and_slide()

func set_horizontal_velocity(dir: Vector2) -> void:
	var direction_3d := (transform.basis * Vector3(dir.x, 0.0, dir.y)).normalized()
	velocity.x = direction_3d.x * speed
	velocity.z = direction_3d.z * speed

func stop_horizontal_velocity() -> void:
	velocity.x = 0.0
	velocity.z = 0.0
