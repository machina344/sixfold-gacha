extends BasePage

@onready var unit_icon: AnimatedSprite2D = $InnerBorder/UnitIcon
@onready var level_label: Label = $InnerBorder/levelLabel

var currentUnit

func _ready() -> void:
	currentUnit = UnitInteraction.interactedIndex
	unit_icon.set_frame(PlayerDataContainer.playerData.characterBox[currentUnit].charID)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	level_label.text = "Lvl: " + str(PlayerDataContainer.playerData.characterBox[currentUnit].level)
	unit_icon.set_frame(PlayerDataContainer.playerData.characterBox[currentUnit].charID)
	

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/characterList.tscn")


func _on_experience_1_pressed() -> void:
	PlayerDataContainer.playerData.characterBox[currentUnit]._set_exp(1000)
	print(PlayerDataContainer.playerData.characterBox[currentUnit].exp)
	print(PlayerDataContainer.playerData.characterBox[currentUnit].level)
	print("Giving 1000 EXP!")



func _on_experience_2_pressed() -> void:
	PlayerDataContainer.playerData.characterBox[currentUnit]._set_exp(10000)
	print(PlayerDataContainer.playerData.characterBox[currentUnit].exp)
	print(PlayerDataContainer.playerData.characterBox[currentUnit].level)
	print("Giving 10000 EXP!")


func _on_experience_3_pressed() -> void:
	PlayerDataContainer.playerData.characterBox[currentUnit]._set_exp(1000000)
	print(PlayerDataContainer.playerData.characterBox[currentUnit].exp)
	print(PlayerDataContainer.playerData.characterBox[currentUnit].level)
	print("Giving 1000000 EXP!")
