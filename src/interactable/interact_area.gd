extends Area3D
class_name Interactable

signal interacted(player: Player)

func interact(player: Player) -> void:
	interacted.emit(player)
