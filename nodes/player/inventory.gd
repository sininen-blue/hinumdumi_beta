extends Node3D
class_name Inventory

signal cant_accept(item: Item)
signal item_dropped(item: Item)

# in weight
@export var max_threshold: float
@export var security_threshold: float

var current_capacity: float = 0


func add_item(item: Item) -> void:
	if item.weight + current_capacity > max_threshold:
		cant_accept.emit(item)
		return
	
	add_child(item)
	_recalculate_capacity()


func remove_item(item_title: String) -> void:
	var items: Array[Node] = get_children()
	
	for item: Item in items:
		if item.title == item_title:
			remove_child(item)
			_recalculate_capacity()
			item.call_deferred("queue_free")
			return


func return_item(item_title: String, from: Shop) -> Item:
	var items: Array[Node] = get_children()
	
	for item: Item in items:
		if item.title == item_title and item.source == from:
			remove_child(item)
			_recalculate_capacity()
			# NOTE: might have to queue free
			# check how add child on other 
			# node works on this
			return item
	
	return null


func drop_item(item_title: String) -> void:
	var items: Array[Node] = get_children()
	
	for item: Item in items:
		if item.title == item_title:
			remove_child(item)
			_recalculate_capacity()
			item_dropped.emit(item)
			# NOTE: might have to queue free
			# check how add child on other 
			# node works on this
			return



func get_item_count(item_title: String) -> int:
	var items: Array[Node] = get_children()
	
	var count: int = 0
	for item: Item in items:
		if item.title == item_title:
			count += 1
	
	return count


func _recalculate_capacity() -> void:
	var items: Array[Node] = get_children()
	
	var new_capacity: float = 0
	for item: Item in items:
		new_capacity += item.weight
	
	current_capacity = new_capacity
