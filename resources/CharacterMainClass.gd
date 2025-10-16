extends Resource
class_name CharacterMainClass

@export var charID = 0

var charTemplate

@export var level = 1
@export var exp = 0 : set = _set_exp

@export var health = 0 : set = _set_exp
@export var attack = 0 : set = _set_exp
@export var defense = 0 : set = _set_exp

@export var healthGrowth = 0
@export var attackGrowth = 0
@export var defenseGrowth = 0

@export var DMReduct = 0
@export var Dodge = 0
@export var DMBoost = 0

@export var Crit = 0
@export var AddChance = 0

func _setTemplate(template : unitTemplate):
	charTemplate = template
	charID = template.characterID

func doAfterLoad():
	charTemplate = UnitRegistry.getTemplate(charID)

func _set_exp(new_value : int):
	if level < 100:
		exp = exp + new_value
		level = round(pow(exp, 0.33333333))
		
		health = health + (healthGrowth * level)
		attack = attack + (attackGrowth * level)
		defense = defense + (defenseGrowth * level)
	else:
		pass

func take_damage(amount : int):
	if (amount - defense) > 0:
		health -= (amount - defense) * float(1 + (DMReduct / 100))
	else:
		pass
