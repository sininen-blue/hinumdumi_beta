extends Camera3D


@export var player: Player
@export var is_in_cinematic: bool


func _ready() -> void:
	self.fov = UserSettings.get_value("camera", "fov")


func _process(_delta: float) -> void:
	if player and not is_in_cinematic:
		self.transform = player.head.transform
