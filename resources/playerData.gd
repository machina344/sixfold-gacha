extends Resource
class_name playerData

@export var playerLevel = 1
@export var playerEXP = 0

@export var coinCurrency = 0
@export var premiumCurrency = 0
@export var characterBox: Array[CharacterMainClass] = []

signal characterAdded
signal characterRemoved

func add_character_to_box(characterTemplate : unitTemplate):
	characterAdded.emit()
	var characterInstance = CharacterMainClass.new()
	characterInstance._setTemplate(characterTemplate)
	characterBox.append(characterInstance)

func remove_character_from_box(characterIndex):
	characterBox.remove_at(characterIndex)
	characterRemoved.emit()
	
func addPlayerEXP(addedEXP):
	playerEXP += addedEXP
	playerLevel = round(pow(playerEXP, 0.285714285714))

	
func doAfterLoad():
	for i in characterBox:
		i.doAfterLoad()
