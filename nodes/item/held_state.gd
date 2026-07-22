extends State

@export var item: Item


func enter() -> void:
	item.freeze = true


func exit() -> void:
	item.freeze = false


func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	pass


func handle_input(event: InputEvent) -> void:
	pass
