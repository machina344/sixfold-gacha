extends Control

@onready var unit_icon: AnimatedSprite2D = $InnerBorder/UnitIcon
@onready var unit_border: AnimatedSprite2D = $UnitBorder
@onready var level_label: Label = $levelLabel
@onready var awakening_level: AnimatedSprite2D = $awakeningLevel


var unit = null
var border = null

func set_empty():
	unit_icon.texture = null
	

func set_unit(new_unit_index):
	unit = new_unit_index
	unit_icon.set_frame(PlayerDataContainer.playerData.characterBox[new_unit_index].charID)
	unit_border.set_frame(PlayerDataContainer.playerData.characterBox[new_unit_index].charTemplate.characterRarity)
	level_label.text = "Lvl: " + str(PlayerDataContainer.playerData.characterBox[new_unit_index].level)
	awakening_level.set_frame(PlayerDataContainer.playerData.characterBox[new_unit_index].stage)
	

func _on_color_rect_gui_input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if UnitInteraction.unitInteractionType == 0:
				UnitInteraction.interactedIndex = unit
				get_tree().change_scene_to_file("res://scenes/characterInformation.tscn")
				print("Viewing ", PlayerDataContainer.playerData.characterBox[unit].charTemplate.name)
			elif UnitInteraction.unitInteractionType == 1:
				UnitInteraction.interactedIndex = unit
				get_tree().change_scene_to_file("res://scenes/TrainingScene.tscn")
				print("Training ", PlayerDataContainer.playerData.characterBox[unit].charTemplate.name)
			elif UnitInteraction.unitInteractionType == 2:
				UnitInteraction.interactedIndex = unit
				get_tree().change_scene_to_file("res://scenes/awakeningScene.tscn")
				print("Awakening ", PlayerDataContainer.playerData.characterBox[unit].charTemplate.name)
			elif UnitInteraction.unitInteractionType == 3:
				print("Selling ", PlayerDataContainer.playerData.characterBox[unit].charTemplate.name)
				if PlayerDataContainer.playerData.characterBox[unit].charTemplate.characterRarity == Rarity.Rarity.COMMON:
					PlayerDataContainer.playerData.coinCurrency += (1000 + (500 * PlayerDataContainer.playerData.characterBox[unit].level))
				elif PlayerDataContainer.playerData.characterBox[unit].charTemplate.characterRarity == Rarity.Rarity.RARE:
					PlayerDataContainer.playerData.coinCurrency += (2000 + (1000 * PlayerDataContainer.playerData.characterBox[unit].level))
				elif PlayerDataContainer.playerData.characterBox[unit].charTemplate.characterRarity == Rarity.Rarity.SUPER_RARE:
					PlayerDataContainer.playerData.coinCurrency += (4500 + (2000 * PlayerDataContainer.playerData.characterBox[unit].level))
				elif PlayerDataContainer.playerData.characterBox[unit].charTemplate.characterRarity == Rarity.Rarity.ULTRA_RARE:
					PlayerDataContainer.playerData.coinCurrency += (15000 + (4000 * PlayerDataContainer.playerData.characterBox[unit].level))
				PlayerDataContainer.playerData.remove_character_from_box(unit)
