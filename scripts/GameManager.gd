extends Node

@onready var hand = $Hand
var deck := Deck.new()

func _ready():
	deck.load_cards()
	deck.shuffle()

	draw_starting_hand()

func draw_starting_hand():
	for i in range(5):
		var card = deck.draw()
		if card:
			hand.add_card(card)
	print(hand.container.get_child_count())
