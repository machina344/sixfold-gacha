extends Control
class_name BasePage

var save_file_path = 'user://save/'
var save_file_name = 'PlayerSave.tres'
var time_in_seconds = 0.5

var uiElements

func _ready():
	uiElements = load("res://scripts/UI/UIManager.gd").new()
	add_child(uiElements)

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		ResourceSaver.save(PlayerDataContainer.playerData, save_file_path + save_file_name)
		print("Saved! Quitting...")
		await get_tree().create_timer(time_in_seconds).timeout
		 # After custom actions, you can manually quit:
		get_tree().quit()
