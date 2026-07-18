extends StateComponent

@export var body: Player
@export var head: Head

@onready var mouse_sens: float = UserSettings.get_value("controls", "mouse_sensitivity")


func handle_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		body.rotation_degrees.y -= event.relative.x * mouse_sens
		head.rotation_degrees.x -= event.relative.y * mouse_sens
		head.rotation_degrees.x = clamp(head.rotation_degrees.x, -80, 80)
