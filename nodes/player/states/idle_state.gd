extends State

@export var player: Player

@onready var idle_crouch_state: State = %IdleCrouchState
@onready var walk_state: State = %WalkState
@onready var run_state: State = %RunState
@onready var jump_state: State = %JumpState
@onready var hide_state: State = %HideState


func enter() -> void:
	pass


func exit() -> void:
	pass


func update(_delta: float) -> void:
	if Input.is_action_pressed("run") and player.direction != Vector3.ZERO:
		state_machine.change_state(run_state)
	elif player.direction != Vector3.ZERO:
		state_machine.change_state(walk_state)


func physics_update(delta: float) -> void:
	pass


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("crouch"):
		state_machine.change_state(idle_crouch_state)
	
	if player.can_jump and event.is_action_pressed("jump"):
		state_machine.change_state(jump_state)
	
	if player.can_hide and event.is_action_pressed("hide"):
		state_machine.change_state(hide_state)
