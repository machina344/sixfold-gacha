extends BasePage

func _ready():
	pass

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
