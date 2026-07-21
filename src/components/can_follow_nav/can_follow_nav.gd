extends StateComponent

@export var monster: Monster
@export var speed: float = 0.0
@export var nav: NavigationAgent3D

var next_path_position: Vector3
var direction: Vector3


func handle_physics_process(delta: float) -> void:
	# nav.target_position = monster.player.position
	# set nav target position on parent state
	next_path_position = nav.get_next_path_position()
	direction = monster.global_position.direction_to(next_path_position)
	monster.velocity = direction * speed
	monster.move_and_slide()
