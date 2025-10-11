extends Resource
class_name playerData

@export var playerLevel = 0
@export var playerEXP = 0

@export var coinCurrency = 0
@export var premiumCurrency = 0
@export var characterBox: Array[CharacterMainClass] = []

func add_character_to_box(characterTemplate : unitTemplate):
	characterBox.append(CharacterMainClass.new(characterTemplate))
	
	
func doAfterLoad():
	for i in characterBox:
		i.doAfterLoad()
