extends Resource

@export var playerLevel = 0
@export var playerEXP = 0

@export var coinCurrency = 0
@export var premiumCurrency = 0
@export var characterBox: Array[CharacterMainClass] = []

func add_character_to_box(characterTemplate : unitTemplate):
	var characterInstance = CharacterMainClass.new()
	characterInstance._setTemplate(characterTemplate)
	characterBox.append(characterInstance)
	
	
func doAfterLoad():
	for i in characterBox:
		i.doAfterLoad()
