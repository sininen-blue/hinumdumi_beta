extends CharacterBody3D
class_name Player

signal stamina_changed(current_stamina: float)

@export var max_stamina: float = 15;
@export var stamina: float = 0:
	set = _set_stamina

@export var mass: float = 5.0

var input_dir: Vector2
var prev_dir: Vector3
var direction: Vector3

var is_on_ground: bool

@onready var head: Head = %Head


func _ready() -> void:
	stamina = max_stamina


func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	if input_dir != Vector2.ZERO:
		prev_dir = direction

	if not is_on_ground:
		velocity += get_gravity() * delta * mass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		pass
		# interact()

	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event.is_action_pressed("mouse_left"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _set_stamina(new_val: float) -> void:
	stamina = new_val
	stamina_changed.emit(new_val)
