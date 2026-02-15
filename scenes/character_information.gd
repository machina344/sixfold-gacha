extends BasePage

@onready var unit_icon: AnimatedSprite2D = $InnerBorder/UnitFull
@onready var level_label: Label = $ColorRect2/levelLabel
@onready var atk_label: Label = $ColorRect2/attackLabel
@onready var def_label: Label = $ColorRect2/defenseLabel
@onready var health_label: Label = $ColorRect2/healthLabel
@onready var leader_label: Label = $ColorRect2/leaderLabel
@onready var passive_label: Label = $ColorRect2/passiveLabel
@onready var name_label: Label = $ColorRect/nameLabel
@onready var element_icon: AnimatedSprite2D = $ColorRect/elementIcon
@onready var rarity_label: Label = $ColorRect/rarityLabel
@onready var awakening_level: AnimatedSprite2D = $ColorRect2/awakeningLevel

var currentUnit

func _ready() -> void:
	currentUnit = UnitInteraction.interactedIndex
	unit_icon.set_frame(PlayerDataContainer.playerData.characterBox[currentUnit].charID)
	level_label.text = "Level: " + str(PlayerDataContainer.playerData.characterBox[currentUnit].level)
	atk_label.text = "Attack: " + str(PlayerDataContainer.playerData.characterBox[currentUnit]._get_attack())
	def_label.text = "Defense: " + str(PlayerDataContainer.playerData.characterBox[currentUnit]._get_defense())
	health_label.text = "Health: " + str(PlayerDataContainer.playerData.characterBox[currentUnit]._get_health())
	leader_label.text = "Leader Skill: \n" + str(PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.leaderSkill)
	passive_label.text = "Passive Skill: \n" + str(PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.passiveSkill)
	name_label.text = str(PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.name)
	element_icon.set_animation(str(PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.element))
	element_icon.set_frame(0)
	awakening_level.set_frame(PlayerDataContainer.playerData.characterBox[currentUnit].stage)
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
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/CharacterList.tscn")
