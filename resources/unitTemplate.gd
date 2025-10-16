extends Resource
class_name unitTemplate

@export var characterID = -1
@export var characterRarity = -1

@export var name = ''

@export var level = 1
@export var exp = 1

@export var health = 0
@export var attack = 0
@export var defense = 0

@export var healthGrowth = 0
@export var attackGrowth = 0
@export var defenseGrowth = 0

@export var element = ''

@export var DMReduct = 0
@export var Dodge = 0
@export var DMBoost = 0
@export var Crit = 0
@export var AddChance = 0
	
func _init(character_ID, character_Rarity, name, level, exp, health, attack, defense, healthGrowth, attackGrowth, defenseGrowth, element, DMReduct, Dodge, DMBoost, Crit, AddChance):
	self.characterID = character_ID
	self.characterRarity = character_Rarity
	self.name = name
	self.level = level
	self.exp = exp
	self.health = health
	self.attack = attack
	self.defense = defense
	self.healthGrowth = healthGrowth
	self.attackGrowth = attackGrowth
	self.defenseGrowth = defenseGrowth
	self.element = element
	self.DMReduct = DMReduct
	self.Dodge = Dodge
	self.DMBoost = DMBoost
	self.Crit = Crit
	self.AddChance = AddChance
