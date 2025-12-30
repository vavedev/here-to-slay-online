extends Control
class_name CardView

@export var card_data: CardData

@onready var image: TextureRect = $Panel/CardImage
@onready var name_label: Label = $Panel/NameLabel
@onready var desc_label: Label = $Panel/DescLabel

var dragging := false
var drag_offset := Vector2.ZERO
var original_parent: Node
var original_position: Vector2

func setup(data):
	if data == null:
		return

	if image:
		image.texture = data.image

	if name_label:
		name_label.text = data.name

	if desc_label:
		desc_label.text = data.description


func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				start_drag(event.position)
			else:
				stop_drag()

	elif event is InputEventMouseMotion and dragging:
		global_position = get_global_mouse_position() - drag_offset


func start_drag(mouse_pos):
	dragging = true
	original_parent = get_parent()
	original_position = global_position
	drag_offset = mouse_pos

	# move to top layer
	get_tree().current_scene.add_child(self)


func stop_drag():
	dragging = false

	# if dropped somewhere invalid → return to hand
	if not is_inside_tree():
		return

	if get_parent() == get_tree().current_scene:
		global_position = original_position
		original_parent.add_child(self)
