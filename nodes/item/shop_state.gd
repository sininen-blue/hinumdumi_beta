extends State

signal buy_failed

@export var item: Item  

@onready var held_state: State = %HeldState


func enter() -> void:
	pass


func exit() -> void:
	pass


func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	pass


func handle_input(event: InputEvent) -> void:
	pass


func _on_interact_area_interacted(player: Player) -> void:
	if player.inventory.get_item_count("coin") < item.price:
		buy_failed.emit()
		return
	
	for i in range(item.price):
		player.inventory.remove_item("coin")
	
	state_machine.change_state(held_state)
	player.inventory.add_item(item)
	call_deferred("queue_free")
