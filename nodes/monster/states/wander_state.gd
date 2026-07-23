extends State


@export var monster: Monster

@onready var timeout_timer: Timer = $TimeoutTimer
@onready var listen_state: State = $"../ListenState"


func enter() -> void:
	timeout_timer.start()


func exit() -> void:
	timeout_timer.stop()


func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	pass


func _on_timeout_timer_timeout() -> void:
	state_machine.change_state(listen_state)


func _on_navigation_agent_3d_navigation_finished() -> void:
	state_machine.change_state(listen_state)
