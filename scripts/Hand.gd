extends Control
class_name Hand

@onready var container := $HBoxContainer
@export var card_scene: PackedScene

func add_card(card_data):
	if card_scene == null:
		push_error("Card scene not assigned in Hand")
		return

	var card = card_scene.instantiate()
	container.add_child(card)

	card.setup(card_data)
