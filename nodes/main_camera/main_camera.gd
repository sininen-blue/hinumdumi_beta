extends Camera3D


func _ready() -> void:
	self.fov = UserSettings.get_value("camera", "fov")
	
	
