extends State

@export var player: Player

@onready var idle_state: State = %IdleState
@onready var crouch_state: State = %CrouchState
@onready var hide_state: State = %HideState


func enter() -> void:
	pass


func exit() -> void:
	pass


func update(_delta: float) -> void:
	if player.direction != Vector3.ZERO:
		state_machine.change_state(crouch_state)


func physics_update(delta: float) -> void:
	pass


func handle_input(event: InputEvent) -> void:
	if player.can_uncrouch and event.is_action_released("crouch"):
		state_machine.change_state(idle_state)
	if player.can_hide and event.is_action_pressed("hide"):
		state_machine.change_state(hide_state)
