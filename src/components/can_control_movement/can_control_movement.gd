extends StateComponent

@export var player: Player
@export var speed: float = 0.0
@export var accel: float = 0.0


func handle_physics_process(_delta: float) -> void:
	player.current_speed = move_toward(player.current_speed, speed, accel)
	player.velocity.x = player.direction.x * player.current_speed
	player.velocity.z = player.direction.z * player.current_speed

	player.move_and_slide()
