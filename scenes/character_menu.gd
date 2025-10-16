extends BasePage


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_character_list_button_pressed() -> void:
	UnitInteraction.unitInteractionType = 0
	get_tree().change_scene_to_file("res://scenes/characterList.tscn")


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")


func _on_training_button_pressed() -> void:
	UnitInteraction.unitInteractionType = 1
	get_tree().change_scene_to_file("res://scenes/characterList.tscn")


func _on_awakening_button_pressed() -> void:
	UnitInteraction.unitInteractionType = 2
	get_tree().change_scene_to_file("res://scenes/characterList.tscn")


func _on_sell_units_button_pressed() -> void:
	UnitInteraction.unitInteractionType = 3
	get_tree().change_scene_to_file("res://scenes/characterList.tscn")
