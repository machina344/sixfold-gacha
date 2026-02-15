extends BasePage

@onready var unit_full: AnimatedSprite2D = $InnerBorder/UnitFull
@onready var level_label: Label = $ColorRect/levelLabel
@onready var awakening_button: Button = $ColorRect/awakeningButton
@onready var name_label: Label = $ColorRect2/nameLabel
@onready var element_icon: AnimatedSprite2D = $ColorRect2/elementIcon
@onready var rarity_label: Label = $ColorRect2/rarityLabel
@onready var awakening_level: AnimatedSprite2D = $ColorRect/awakeningLevel

var currentUnit

var cost

var canAwaken

func _ready() -> void:
	currentUnit = UnitInteraction.interactedIndex
	unit_full.set_frame(PlayerDataContainer.playerData.characterBox[currentUnit].charID)
	name_label.text = str(PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.name)
	element_icon.set_animation(str(PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.element))
	element_icon.set_frame(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	level_label.text = "Lvl: " + str(PlayerDataContainer.playerData.characterBox[currentUnit].level)
	unit_full.set_frame(PlayerDataContainer.playerData.characterBox[currentUnit].charID)
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

	if PlayerDataContainer.playerData.characterBox[currentUnit].stage == 6 || ( PlayerDataContainer.playerData.characterBox[currentUnit].stage == 5 && PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.awakensInto == null ):
		awakening_button.text = "Maximum Stage!"
		canAwaken = false
	else:
		canAwaken = true
		if PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.characterRarity == Rarity.Rarity.COMMON:
			cost = 1000 * (2 ** PlayerDataContainer.playerData.characterBox[currentUnit].stage)
		elif PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.characterRarity == Rarity.Rarity.RARE:
			cost = 2000 * (2 ** PlayerDataContainer.playerData.characterBox[currentUnit].stage)
		elif PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.characterRarity == Rarity.Rarity.SUPER_RARE:
			cost = 4500 * (2 ** PlayerDataContainer.playerData.characterBox[currentUnit].stage)
		elif PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.characterRarity == Rarity.Rarity.ULTRA_RARE:
			cost = 15000 * (2 ** PlayerDataContainer.playerData.characterBox[currentUnit].stage)
		awakening_button.text = "Awakening Cost: " + str(cost)

	


func _on_awakening_button_pressed() -> void:
	if canAwaken == true:
		if PlayerDataContainer.playerData.coinCurrency >= cost && PlayerDataContainer.playerData.characterBox[currentUnit].stage < 6:
			PlayerDataContainer.playerData.characterBox[currentUnit]._set_stage(0)
			print(PlayerDataContainer.playerData.characterBox[currentUnit].stage)
			PlayerDataContainer.playerData.coinCurrency -= cost
			awakening_button.text = "Awakening Cost: " + str(cost)
		elif PlayerDataContainer.playerData.characterBox[currentUnit].stage == 6:
			awakening_button.text = "Maximum Stage!"
			await get_tree().create_timer(time_in_seconds).timeout
			awakening_button.text = "Awakening Cost: " + str(cost)
		elif PlayerDataContainer.playerData.coinCurrency < cost:
			awakening_button.text = "Not enough Ryo!"
			await get_tree().create_timer(time_in_seconds).timeout
			awakening_button.text = "Awakening Cost: " + str(cost)
	else:
		pass


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/characterList.tscn")
