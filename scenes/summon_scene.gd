extends BasePage

var MultiSize = 10

@onready var multiButton = get_node("MultiSummon")
@onready var singleButton = get_node("SingleSummon")

func _on_single_summon_pressed():
	if PlayerDataContainer.playerData.premiumCurrency >= 10:
		PlayerDataContainer.playerData.premiumCurrency -= 10
		await translate_unit_info() 
	else:
		singleButton.text = "Not Enough Gems!"
		await get_tree().create_timer(time_in_seconds).timeout
		singleButton.text = "Single-Summon"

func _on_multi_summon_pressed(): # Multi summon button
	if PlayerDataContainer.playerData.premiumCurrency >= 100:
		PlayerDataContainer.playerData.premiumCurrency -= 100
		for n in MultiSize:
			await translate_unit_info()
	else:
		multiButton.text = "Not Enough Gems!"
		await get_tree().create_timer(time_in_seconds).timeout
		multiButton.text = "Multi-Summon"

func translate_unit_info():
	var template = UnitRegistry.getRandomTemplate() #Retrieving the information, will also use this function to translate the information into picture actions and more.
	
	
	if template.characterRarity == Rarity.Rarity.ULTRA_RARE: #UR rarity, takes the index in context of the URcharacters list.
		print("UR " + template.name) # Prints the name and rarity of the unit to the console for posterity
		await summon_image($UrOverlay, template) # Gets the visual indicator for the particular unit in order: Godot Object ID, Dictionary Object, Animation Object-Applicable String, and Character name (use find_key for key number)
		PlayerDataContainer.playerData.add_character_to_box(template)
	elif template.characterRarity == Rarity.Rarity.SUPER_RARE: #Same as above, but SRs, and so on.
		print("SR " + template.name)
		await summon_image($SrOverlay, template)
		PlayerDataContainer.playerData.add_character_to_box(template)
	elif template.characterRarity == Rarity.Rarity.RARE:
		print("R " + template.name)
		await summon_image($ROverlay, template)
		PlayerDataContainer.playerData.add_character_to_box(template)
	elif template.characterRarity == Rarity.Rarity.COMMON:
		print("C " + template.name)
		await summon_image($COverlay, template)
		PlayerDataContainer.playerData.add_character_to_box(template)

func summon_image(ID, template):
	var summonFrame = ID # Gets the C/R/SR/UR Summon Frame
	var summonImage = $SummonIcons #Gets the AnimatedSprite2D corresponding to every unit's image
	summonImage.set_animation('Units') #Setting the summonImage 2D sprite to the specific animation pack,
	summonImage.set_frame(template.characterID) # and then setting the particular frame.
	summonFrame.visible = true
	summonImage.visible = true
	await get_tree().create_timer(time_in_seconds).timeout
	summonFrame.visible = false
	summonImage.visible = false

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
	
func _on_c_list_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Character_menu.tscn")
