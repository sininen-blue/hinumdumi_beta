extends Node

@export var body: Player
@export var head: Head

var state_machine: StateMachine
var parent_state: State

@onready var mouse_sens: float = UserSettings.get_value("controls", "mouse_sensitivity")


func _ready() -> void:
	var parent: Node = get_parent()
	assert(parent is not State, "Parent must be state")
	
	parent_state = parent
	state_machine = parent_state.state_machine


func _input(event: InputEvent) -> void:
	if state_machine.current_state != parent_state:
		return
	
	if event is InputEventMouseMotion:
		body.rotation_degrees.y -= event.relative.x * mouse_sens
		head.rotation_degrees.x -= event.relative.y * mouse_sens
		head.rotation_degrees.x = clamp(head.rotation_degrees.x, -80, 80)
