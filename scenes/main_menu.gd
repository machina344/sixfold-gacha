extends BasePage

func _ready():
	verify_save_directory(save_file_path) #verifying that the save directory is valid
	if !ResourceLoader.exists(save_file_path + save_file_name):
		PlayerDataContainer.playerData = playerData.new()
		ResourceSaver.save(PlayerDataContainer.playerData, save_file_path + save_file_name)
	PlayerDataContainer.playerData = ResourceLoader.load(save_file_path + save_file_name)
	get_tree().set_auto_accept_quit(false) # Disable automatic quitting
	PlayerDataContainer.playerData.doAfterLoad()
	uiElements = load("res://scripts/UI/UIManager.gd").new()
	add_child(uiElements)
	
	
func verify_save_directory(path : String):
	DirAccess.make_dir_absolute(path) #Making sure that the path exists, creating it if it doesn't

func _on_summon_button_pressed():
	get_tree().change_scene_to_file("res://scenes/SummonScene.tscn")


func _on_c_list_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/character_menu.tscn") # Replace with function body.


func _on_play_button_pressed() -> void:
	PlayerDataContainer.playerData.premiumCurrency += 100
