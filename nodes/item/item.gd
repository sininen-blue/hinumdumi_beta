extends RigidBody3D
class_name Item

@export var title: String
@export var price: int = 1
@export var weight: float = 0.0
@export var model: PackedScene

var source: Shop

func _ready() -> void:
	if model:
		var model_instance: Node3D = model.instantiate()
		add_child(model_instance)
