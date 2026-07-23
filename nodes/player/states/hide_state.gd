extends State

@onready var idle_state: State = %IdleState

func enter() -> void:
	pass


func exit() -> void:
	pass


func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	pass


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("hide"):
		state_machine.change_state(idle_state)
