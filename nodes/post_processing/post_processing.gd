extends CanvasLayer

@export var player: Player
@export var vignette_curve: Curve

func _ready() -> void:
	if player:
		player.stamina_changed.connect(_on_stamina_changed)


func _on_stamina_changed(stamina: float) -> void:
	# do shader value changes here
	pass
