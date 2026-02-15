extends BasePage
class_name TrainingScene

@onready var unit_full: AnimatedSprite2D = $InnerBorder/UnitFull
@onready var level_label: Label = $levelLabel
@onready var name_label: Label = $ColorRect2/nameLabel
@onready var element_icon: AnimatedSprite2D = $ColorRect2/elementIcon
@onready var rarity_label: Label = $ColorRect2/rarityLabel
@onready var awakening_level: AnimatedSprite2D = $awakeningLevel

var currentUnit

func _ready() -> void:
	currentUnit = UnitInteraction.interactedIndex
	unit_full.set_frame(PlayerDataContainer.playerData.characterBox[currentUnit].charID)
	awakening_level.set_frame(PlayerDataContainer.playerData.characterBox[currentUnit].stage)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	level_label.text = "Lvl: " + str(PlayerDataContainer.playerData.characterBox[currentUnit].level)
	unit_full.set_frame(PlayerDataContainer.playerData.characterBox[currentUnit].charID)
	name_label.text = str(PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.name)
	element_icon.set_animation(str(PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.element))
	element_icon.set_frame(0)
	if PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.characterRarity == 0:
		rarity_label.text = "[C]"
	elif PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.characterRarity == 1:
		rarity_label.text = "[R]"
	elif PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.characterRarity == 2:
		rarity_label.text = "[SR]"
	elif PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.characterRarity == 3:
		rarity_label.text = "[UR]"
	elif PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.characterRarity == 4:
		rarity_label.text = "[LR]"
	

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/characterList.tscn")


func _on_experience_1_pressed() -> void:
	PlayerDataContainer.playerData.characterBox[currentUnit]._set_exp(1000)
	print(PlayerDataContainer.playerData.characterBox[currentUnit].exp)
	print(PlayerDataContainer.playerData.characterBox[currentUnit].level)
	print("Giving 1000 EXP!")



func _on_experience_2_pressed() -> void:
	PlayerDataContainer.playerData.characterBox[currentUnit]._set_exp(10000)
	print(PlayerDataContainer.playerData.characterBox[currentUnit].exp)
	print(PlayerDataContainer.playerData.characterBox[currentUnit].level)
	print("Giving 10000 EXP!")


func _on_experience_3_pressed() -> void:
	PlayerDataContainer.playerData.characterBox[currentUnit]._set_exp(1000000)
	print(PlayerDataContainer.playerData.characterBox[currentUnit].exp)
	print(PlayerDataContainer.playerData.characterBox[currentUnit].level)
	print("Giving 1000000 EXP!")
