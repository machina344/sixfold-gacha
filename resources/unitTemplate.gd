extends Resource
class_name unitTemplate

@export var characterID = -1
@export var characterRarity = -1

@export var name = ''

@export var level = 1
@export var exp = 1
@export var stage = 0

@export var health = 0
@export var attack = 0
@export var defense = 0

@export var healthGrowth = 0
@export var attackGrowth = 0
@export var defenseGrowth = 0

@export var element = ''

@export var leaderSkill = ''
@export var passiveSkill = ''

@export var DMReduct = 0
@export var Dodge = 0
@export var DMBoost = 0
@export var Crit = 0
@export var AddChance = 0

@export var isSummonable = true

@export var awakensInto = null
	
func _init(character_ID, character_Rarity, name, level, exp, stage, health, attack, defense, healthGrowth, attackGrowth, defenseGrowth, element, leaderSkill, passiveSkill, DMReduct, Dodge, DMBoost, Crit, AddChance, isSummonable, awakensInto):
	self.characterID = character_ID
	self.characterRarity = character_Rarity
	
	self.name = name
	
	self.level = level
	self.exp = exp
	self.stage = stage
	
	self.health = health
	self.attack = attack
	self.defense = defense
	
	self.healthGrowth = healthGrowth
	self.attackGrowth = attackGrowth
	self.defenseGrowth = defenseGrowth
	
	self.element = element
	
	self.leaderSkill = leaderSkill
	self.passiveSkill = passiveSkill
	
	self.DMReduct = DMReduct
	self.Dodge = Dodge
	self.DMBoost = DMBoost
	self.Crit = Crit
	self.AddChance = AddChance
	
	self.isSummonable = isSummonable
	
	self.awakensInto = awakensInto
	
