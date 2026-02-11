extends Resource
class_name CharacterMainClass

@export var charID = 0

var charTemplate

@export var level = 1
@export var exp = 0
@export var stage = 0

@export var health = 0
@export var attack = 0
@export var defense = 0

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
	if level < 80 + (20 * stage):
		exp = exp + new_value
		var newlevel = round(pow(exp, 0.33333333))
		
		while(level < newlevel && level < (80 + (20 * stage))):
			_level_up()
	else:
		print("Max level!")

func _level_up():
	level += 1
	health += charTemplate.healthGrowth
	attack += charTemplate.attackGrowth
	defense += charTemplate.defenseGrowth
	
func _set_stage(check_level : int):
	check_level = level
	if level >=  80 + (20 * stage) && stage < 5:	
		stage += 1
		print("Awakened to stage ", stage, "!")
	elif level >=  80 + (20 * stage) && stage == 5:
		if charTemplate.awakensInto == null:
			print("Max Awakening for this character!")
		else:
			print("Awakening to maximum stage!")
			_awaken()
	else:
		print("Can't awaken, this is an ERROR")

func _awaken():
	charID = charTemplate.awakensInto
	level = 1
	exp = 0
	stage = 6
	health = 0
	attack = 0
	defense = 0
	doAfterLoad()

func _get_health():
	return health + charTemplate.health

func _get_attack():
	return attack + charTemplate.attack

func _get_defense():
	return defense + charTemplate.defense

func take_damage(amount : int):
	if (amount - defense) > 0:
		health -= (amount - defense) * float(1 + (DMReduct / 100))
	else:
		pass
