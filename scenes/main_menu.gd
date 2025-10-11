extends BasePage

func _ready():
	verify_save_directory(save_file_path) #verifying that the save directory is valid
	PlayerDataContainer.playerData = ResourceLoader.load(save_file_path + save_file_name)
	get_tree().set_auto_accept_quit(false) # Disable automatic quitting
	PlayerDataContainer.playerData.doAfterLoad()
	
func verify_save_directory(path : String):
	DirAccess.make_dir_absolute(path) #Making sure that the path exists, creating it if it doesn't

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/StartScreen.tscn")

func _on_summon_button_pressed():
	get_tree().change_scene_to_file("res://scenes/SummonScene.tscn")


func _on_c_list_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/CharacterList.tscn") # Replace with function body.
