extends Resource
class_name CardData

@export var name: String
@export var description: String
@export var image: Texture2D

@export_enum("Leader", "Item", "Hero", "Cursed_Item", "Magic", "Modifier", "Monster", "Etc") var card_type: String
@export_enum("Fighter", "Ranger", "Bard", "Thief", "Guardian", "Wizard") var class_type: String

@export var requirements: Requirement
