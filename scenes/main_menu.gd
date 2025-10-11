extends Control
class_name MainMenu

var save_file_path = 'user://save/'
var save_file_name = 'PlayerSave.tres'

var PlayerData = playerData.new()

var time_in_seconds = 0.5


func _ready():
	verify_save_directory(save_file_path) #verifying that the save directory is valid
	PlayerData = ResourceLoader.load(save_file_path + save_file_name).duplicate(true)
	get_tree().set_auto_accept_quit(false) # Disable automatic quitting
	PlayerData.doAfterLoad()
	
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		ResourceSaver.save(PlayerData, save_file_path + save_file_name)
		print("Saved! Quitting...")
		await get_tree().create_timer(time_in_seconds).timeout
		 # After custom actions, you can manually quit:
		get_tree().quit()
	
func verify_save_directory(path : String):
	DirAccess.make_dir_absolute(path) #Making sure that the path exists, creating it if it doesn't

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/StartScreen.tscn")

func _on_summon_button_pressed():
	get_tree().change_scene_to_file("res://scenes/SummonScene.tscn")


func _on_c_list_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/CharacterList.tscn") # Replace with function body.
