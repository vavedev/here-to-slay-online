extends Node
class_name Deck

var cards: Array[CardData] = []

func load_cards():
	cards.clear()
	var dir = DirAccess.open("res://data/leaders/")
	for file in dir.get_files():
		if file.ends_with(".tres"):
			var card = load("res://data/leaders/" + file)
			cards.append(card)

func shuffle():
	cards.shuffle()

func draw():
	if cards.is_empty():
		return null
	return cards.pop_back()
