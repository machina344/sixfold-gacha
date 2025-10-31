extends BasePage

@onready var unit_icon: AnimatedSprite2D = $InnerBorder/UnitIcon
@onready var level_label: Label = $InnerBorder/levelLabel
@onready var awakening_label: Label = $InnerBorder/awakeningLabel
@onready var awakening_button: Button = $awakeningButton

var currentUnit

var cost

var canAwaken

func _ready() -> void:
	currentUnit = UnitInteraction.interactedIndex
	unit_icon.set_frame(PlayerDataContainer.playerData.characterBox[currentUnit].charID)
	if PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.characterRarity == Rarity.Rarity.COMMON:
		cost = 1000 * (2 ** PlayerDataContainer.playerData.characterBox[currentUnit].stage)
	elif PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.characterRarity == Rarity.Rarity.RARE:
		cost = 2000 * (2 ** PlayerDataContainer.playerData.characterBox[currentUnit].stage)
	elif PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.characterRarity == Rarity.Rarity.SUPER_RARE:
		cost = 4500 * (2 ** PlayerDataContainer.playerData.characterBox[currentUnit].stage)
	elif PlayerDataContainer.playerData.characterBox[currentUnit].charTemplate.characterRarity == Rarity.Rarity.ULTRA_RARE:
		cost = 15000 * (2 ** PlayerDataContainer.playerData.characterBox[currentUnit].stage)
	awakening_button.text = "Awakening Cost: " + str(cost)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	level_label.text = "Lvl: " + str(PlayerDataContainer.playerData.characterBox[currentUnit].level)
	awakening_label.text = "Awakening: " + str(PlayerDataContainer.playerData.characterBox[currentUnit].stage)
	unit_icon.set_frame(PlayerDataContainer.playerData.characterBox[currentUnit].charID)
	if PlayerDataContainer.playerData.characterBox[currentUnit].stage == 6:
		awakening_button.text = "Maximum Stage!"
		canAwaken = false
	else:
		canAwaken = true

	


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
