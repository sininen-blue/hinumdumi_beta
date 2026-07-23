extends RayCast3D

signal player_seen

@export var monster: Monster
@export_range(0, 1, 0.01, "or_greater") var vision_gain_speed: float = 1
@export_range(0, 1, 0.01, "or_greater") var vision_loss_speed: float = 0.5

var vision_range: float = 0
var vision_score: float = 0:
	set = _set_vision_score

var can_see_player: bool = false


func _process(delta: float) -> void:
	var collided: Object = self.get_collider()
	can_see_player = collided is Player
	
	if can_see_player:
		vision_score += vision_gain_speed * delta
	else:
		vision_score -= vision_loss_speed * delta
	
	if monster.player:
		self.target_position = monster.player.global_position
		self.target_position.limit_length(vision_range)


func _set_vision_score(new_val: float) -> void:
	vision_score = new_val
	
	if vision_score >= 1.0:
		player_seen.emit()
	
	vision_score = clamp(vision_score, 0, 1.0)
