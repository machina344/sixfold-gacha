extends Node

var count = -1
var unitDict = {}
var commonHogs = registerNew(Rarity.Rarity.COMMON, '30-50 Feral Hogs', 1, 1, 1, 1, 1, 8, 8, 8, 'Earth', 0, 0, 0, 0, 0)
var rareGuy = registerNew(Rarity.Rarity.RARE, 'Guy', 1, 1, 1, 1, 1, 8, 8, 8, 'Wind', 0, 0, 0, 0, 0)
var rareBadGuy = registerNew(Rarity.Rarity.RARE, 'Bad Guy', 1, 1, 1, 1, 1, 8, 8, 8, 'Fire', 0, 0, 0, 0, 0)
var superRareUchihaAkira = registerNew(Rarity.Rarity.SUPER_RARE, 'Uchiha Akira', 1, 1, 1, 1, 1, 8, 8, 8, 'Fire', 0, 0, 0, 0, 0)
var superRareUchihaItami = registerNew(Rarity.Rarity.SUPER_RARE, 'Uchiha Itami', 1, 1, 1, 1, 1, 8, 8, 8, 'Lightning', 0, 0, 0, 0, 0)
var superRareSenjuTarashi = registerNew(Rarity.Rarity.SUPER_RARE, 'Senju Tarashi', 1, 1, 1, 1, 1, 8, 8, 8, 'Earth', 0, 0, 0, 0, 0)
var ultraRareUchihaSetsuna = registerNew(Rarity.Rarity.ULTRA_RARE, 'Uchiha Setsuna', 1, 1, 1, 1, 1, 8, 8, 8, 'Fire', 0, 0, 0, 0, 0)
var ultraRareHyugaHeika = registerNew(Rarity.Rarity.ULTRA_RARE, 'Hyuga Heika', 1, 1, 1, 1, 1, 8, 8, 8, 'Earth', 0, 0, 0, 0, 0)
var ultraRareHotdog = registerNew(Rarity.Rarity.ULTRA_RARE, 'Hotdog', 1, 1, 1, 1, 1, 8, 8, 8, 'Water', 0, 0, 0, 0, 0)

var rng = RandomNumberGenerator.new()

var rarities = {Rarity.Rarity.COMMON : 35,
				Rarity.Rarity.RARE: 45,
				Rarity.Rarity.SUPER_RARE: 19,
				Rarity.Rarity.ULTRA_RARE: 1}

func registerNew(character_Rarity, name, level, exp, health, attack, defense, healthGrowth, attackGrowth, defenseGrowth, element, DMReduct, Dodge, DMBoost, Crit, AddChance):
	count+=1
	return register(unitTemplate.new(count, character_Rarity, name, level, exp, health, attack, defense, healthGrowth, attackGrowth, defenseGrowth, element, DMReduct, Dodge, DMBoost, Crit, AddChance))

func register(template : unitTemplate):
	unitDict[template.characterID] = template
	return template

func getRandomTemplate() -> unitTemplate:
	var rarity = get_rarity()
	var filteredDict = unitDict.values().filter(func(o):
		return o.characterRarity == rarity )
	return filteredDict[rng.randi_range(0, filteredDict.size()-1)]
	
func get_rarity():

	rng.randomize()

	var weighted_sum = 0

	for n in rarities:
		
		#Adding all of the rarities together for every rarity applicable
		weighted_sum += rarities[n]
		
	# Getting the random number in the range from 0 to the weighted sum
		
	var item = rng.randi_range(0,weighted_sum)
	
	for n in rarities:
		
		# If the random number has the 'budget' to 'acquire' an item (largest, or most common first), it subtracts the weight of the rarity.
		
		if item <= rarities[n]:
			return n #returns the first item it can 'afford'
		item -= rarities[n]

func getTemplate(ID):
	return unitDict[ID]
