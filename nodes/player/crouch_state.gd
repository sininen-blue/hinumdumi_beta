extends State

@export var player: Player

@onready var idle_crouch_state: State = %IdleCrouchState
@onready var walk_state: State = %WalkState
@onready var hide_state: State = %HideState

func enter() -> void:
	pass


func exit() -> void:
	pass


func update(_delta: float) -> void:
	if player.direction == Vector3.ZERO:
		state_machine.change_state(idle_crouch_state)


func physics_update(delta: float) -> void:
	pass


func handle_input(event: InputEvent) -> void:
	if event.is_action_released("crouch"):
		state_machine.change_state(walk_state)
	if event.is_action_released("hide"):
		state_machine.change_state(hide_state)
