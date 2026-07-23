extends State

@export var player: Player

func enter() -> void:
	pass


func exit() -> void:
	pass


func update(_delta: float) -> void:
	if player.is_on_ground:
		state_machine.change_state(state_machine.previous_state)


func physics_update(delta: float) -> void:
	pass


func handle_input(event: InputEvent) -> void:
	pass
