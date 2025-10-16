extends BasePage

@onready var unit_icon: AnimatedSprite2D = $InnerBorder/UnitIcon
@onready var level_label: Label = $InnerBorder/levelLabel
@onready var atk_label: Label = $InnerBorder/ATKLabel
@onready var def_label: Label = $InnerBorder/DEFLabel
@onready var health_label: Label = $InnerBorder/HealthLabel

var currentUnit

func _ready() -> void:
	currentUnit = UnitInteraction.interactedIndex
	unit_icon.set_frame(PlayerDataContainer.playerData.characterBox[currentUnit].charID)
	level_label.text = "Level: " + str(PlayerDataContainer.playerData.characterBox[currentUnit].level)
	atk_label.text = "Attack: " + str(PlayerDataContainer.playerData.characterBox[currentUnit]._get_attack())
	def_label.text = "Defense: " + str(PlayerDataContainer.playerData.characterBox[currentUnit]._get_defense())
	health_label.text = "Health: " + str(PlayerDataContainer.playerData.characterBox[currentUnit]._get_health())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/CharacterList.tscn")
