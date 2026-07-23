extends State

@export var player: Player

@onready var idle_state: State = %IdleState
@onready var walk_state: State = %WalkState
@onready var jump_state: State = %JumpState
@onready var hide_state: State = %HideState


func enter() -> void:
	pass


func exit() -> void:
	pass


func update(delta: float) -> void:
	if player.stamina <= 0:
		state_machine.change_state(walk_state)
	
	if player.direction == Vector3.ZERO:
		state_machine.change_state(idle_state)


func physics_update(delta: float) -> void:
	pass


func handle_input(event: InputEvent) -> void:
	if event.is_action_released("run"):
		state_machine.change_state(walk_state)
	
	if player.can_jump and event.is_action_pressed("jump"):
		state_machine.change_state(jump_state)
	
	if player.can_hide and event.is_action_pressed("hide"):
		state_machine.change_state(hide_state)
	
