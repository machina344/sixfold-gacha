extends Control

@onready var unit_icon: AnimatedSprite2D = $InnerBorder/UnitIcon
@onready var unit_border: AnimatedSprite2D = $InnerBorder/UnitBorder

var unit = null
var border = null

func set_empty():
	unit_icon.texture = null
	

func set_unit(new_unit_index):
	unit = new_unit_index
	unit_icon.set_frame(PlayerDataContainer.playerData.characterBox[new_unit_index].charID)
	unit_border.set_frame(PlayerDataContainer.playerData.characterBox[new_unit_index].charTemplate.characterRarity)

func _on_color_rect_gui_input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			print("Selling ", PlayerDataContainer.playerData.characterBox[unit].charTemplate.name)
			$ColorRect.visible = false
			$UsagePanel.visible = true
			$ColorRect.set_mouse_filter(Control.MOUSE_FILTER_PASS)


func _on_color_rect_mouse_exited():
	$UsagePanel.visible = false
	$ColorRect.visible = true
	$ColorRect.set_mouse_filter(Control.MOUSE_FILTER_STOP)
	
func _on_usage_panel_mouse_exited() -> void:
	if($ColorRect.mouse_filter==1):
		$ColorRect.set_mouse_filter(Control.MOUSE_FILTER_STOP)
		$UsagePanel.visible = false
		$ColorRect.visible = true
	else:
		print("No issues here!", $ColorRect.mouse_filter)
