extends BasePage

@onready var grid_container: GridContainer = $ScrollContainer/GridContainer
@onready var inventory_slot_scene = preload("res://scenes/inventory_slot.tscn")

func _ready():
	PlayerDataContainer.playerData.characterAdded.connect(_on_inventory_updated)
	_on_inventory_updated()
	
func _on_inventory_updated():
	
	clear_grid_container()
	for unit in PlayerDataContainer.playerData.characterBox.size():
		var slot = inventory_slot_scene.instantiate()
		grid_container.add_child(slot)
		if unit != null:
			slot.set_unit(unit)
		else:
			slot.set_empty()

func clear_grid_container():
	while grid_container.get_child_count() > 0:
		var child = grid_container.get_child(0)
		grid_container.remove_child(child)
		child.queue_free()
	
func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/character_menu.tscn")
	
