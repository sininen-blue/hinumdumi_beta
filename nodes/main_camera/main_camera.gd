extends Camera3D


@export var player: Player


func _ready() -> void:
	self.fov = UserSettings.get_value("camera", "fov")
