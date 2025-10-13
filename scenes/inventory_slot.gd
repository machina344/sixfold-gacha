extends Control

@onready var unit_icon: AnimatedSprite2D = $InnerBorder/UnitIcon
@onready var unit_border: AnimatedSprite2D = $InnerBorder/UnitBorder

var unit = null

func set_empty():
	unit_icon.texture = null
	

func set_unit(new_unit):
	unit = new_unit
	unit_icon.set_frame(PlayerDataContainer.playerData.characterBox[new_unit].charID)

func _on_color_rect_gui_input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			$ColorRect.visible = false
			$UsagePanel.visible = true


func _on_color_rect_mouse_exited():
	$UsagePanel.visible = false
	$ColorRect.visible = true
	


func _on_sell_button_pressed() -> void:
	print("Sold!") # Replace with function body.
