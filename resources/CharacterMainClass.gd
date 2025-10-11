extends Resource
class_name CharacterMainClass

@export var charID = 0

var charTemplate

@export var level = 0 : set = _set_level

@export var health = 0 : set = _set_health
@export var attack = 0 : set = _set_attack
@export var defense = 0 : set = _set_defense

@export var DMReduct = 0
@export var Dodge = 0
@export var DMBoost = 0

@export var Crit = 0
@export var AddChance = 0

func _init(template : unitTemplate):
	charTemplate = template
	charID = template.characterID

func doAfterLoad():
	charTemplate = UnitRegistry.getTemplate(charID)

func _set_level(new_value : int):
	level = new_value

func _set_health(new_value : int):
	health = new_value
	
func _set_attack(new_value : int):
	attack = new_value

func _set_defense(new_value : int):
	defense = new_value

func take_damage(amount : int):
	if (amount - defense) > 0:
		health -= (amount - defense) * float(1 + (DMReduct / 100))
	else:
		pass
