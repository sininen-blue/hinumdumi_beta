extends Node
class_name StateComponent

var state_machine: StateMachine
var parent_state: State


func _process(delta: float) -> void:
	if state_machine == null:
		return
	
	if state_machine.current_state != parent_state:
		return
	
	handle_process(delta)


func _physics_process(delta: float) -> void:
	if state_machine == null:
		return
	
	if state_machine.current_state != parent_state:
		return
	
	handle_physics_process(delta)


func _input(event: InputEvent) -> void:
	if state_machine == null:
		return
	
	if state_machine.current_state != parent_state:
		return
		
	handle_input(event)


func handle_physics_process(delta: float) -> void:
	pass


func handle_process(delta: float) -> void:
	pass


func handle_input(event: InputEvent) -> void:
	pass
