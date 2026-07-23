extends RayCast3D

signal player_heard

@export var monster: Monster
@export var hearing_range: float = 20.0

var hearing_sensitivity: int = 1

var can_hear_player: bool = false:
	set = _set_can_hear_player


func _process(_delta: float) -> void:
	var collided: Object = self.get_collider()
	can_hear_player = collided is Player
	
	if monster.player:
		self.target_position = monster.player.global_position
		self.target_position.limit_length(hearing_range)


func _set_can_hear_player(new_val: bool) -> void:
	if new_val != can_hear_player:
		can_hear_player = new_val
		
		var collided: Object = self.get_collider()
		var player: Player = collided as Player
		if can_hear_player:
			player.noise_made.connect(_on_player_noise_made)
		else:
			player.noise_made.disconnect(_on_player_noise_made)
			

func _on_player_noise_made(noise_level: int) -> void:
	if noise_level >= hearing_sensitivity:
		player_heard.emit()
