extends State

@export var monster: Monster
@export var min_duration: float = 0.5
@export var max_duration: float = 3.0

@onready var duration_timer: Timer = $DurationTimer
@onready var wander_state: State = %WanderState


func enter() -> void:
	var duration: float = randf_range(min_duration, max_duration)
	duration_timer.start(duration)


func exit() -> void:
	duration_timer.stop()


func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	pass


func _on_duration_timer_timeout() -> void:
	state_machine.change_state(wander_state)
