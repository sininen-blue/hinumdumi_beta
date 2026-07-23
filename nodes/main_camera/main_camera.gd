extends Camera3D


@export var player: Player
@export var is_in_cinematic: bool


func _ready() -> void:
	self.fov = UserSettings.get_value("camera", "fov")


func _process(_delta: float) -> void:
	if player == null:
		return
	
	if "Cinematic" not in player.state_machine.current_state.name:
		self.transform = player.head.transform
