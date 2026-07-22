class_name State
extends Node

var state_machine: StateMachine = null


func _ready() -> void:
	var children: Array[Node] = get_children()
	
	for child: Node in children:
		if child is StateComponent:
			child.parent_state = self
			child.state_machine = state_machine


func enter() -> void:
	pass


func exit() -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	pass


func handle_input(_event: InputEvent) -> void:
	pass
