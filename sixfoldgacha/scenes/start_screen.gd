extends Control


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
	


func _on_help_button_pressed():
	get_tree().change_scene_to_file("res://scenes/HelpPage.tscn")
