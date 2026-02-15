extends Node

var count = -1
var unitDict = {}

# Unit Set 1

var commonHogs = registerNew(Rarity.Rarity.COMMON, '30-50 Hogs', 1, 1, 0, 1, 1, 1, 8, 8, 8, 'Earth', 'N/A', '+10% attack in combat', 0, 0, 0, 0, 0, true, 9)
var rareGuy = registerNew(Rarity.Rarity.RARE, 'Guy', 1, 1, 0, 1, 1, 1, 8, 8, 8, 'Wind', 'N/A', '+10% attack in combat', 0, 0, 0, 0, 0, true, 10)
var rareBadGuy = registerNew(Rarity.Rarity.RARE, 'Bad Guy', 1, 1, 0, 1, 1, 1, 8, 8, 8, 'Fire', 'N/A', '+10% attack in combat', 0, 0, 0, 0, 0, true)
var superRareUchihaAkira = registerNew(Rarity.Rarity.SUPER_RARE, 'Uchiha Akira', 1, 1, 0, 1, 1, 1, 8, 8, 8, 'Fire', 'N/A', '+10% attack in combat', 0, 0, 0, 0, 0, true, 12)
var superRareUchihaItami = registerNew(Rarity.Rarity.SUPER_RARE, 'Uchiha Itami', 1, 1, 0, 1, 1, 1, 8, 8, 8, 'Lightning', 'N/A', '+10% attack in combat', 0, 0, 0, 0, 0, true)
var superRareSenjuTarashi = registerNew(Rarity.Rarity.SUPER_RARE, 'Senju Tarashi', 1, 1, 0, 1, 1, 1, 8, 8, 8, 'Earth', 'N/A', '+10% attack in combat', 0, 0, 0, 0, 0, true)
var ultraRareUchihaSetsuna = registerNew(Rarity.Rarity.ULTRA_RARE, 'Uchiha Setsuna', 1, 1, 0, 1, 1, 1, 8, 8, 8, 'Fire', 'N/A', '+10% attack in combat', 0, 0, 0, 0, 0, true)
var ultraRareHyugaHeika = registerNew(Rarity.Rarity.ULTRA_RARE, 'Hyuga Heika', 1, 1, 0, 1, 1, 1, 8, 8, 8, 'Earth', 'N/A', '+10% attack in combat', 0, 0, 0, 0, 0, true)
var ultraRareHotdog = registerNew(Rarity.Rarity.ULTRA_RARE, 'Hotdog', 1, 1, 0, 1, 1, 1, 8, 8, 8, 'Water', 'N/A', '+10% attack in combat', 0, 0, 0, 0, 0, true, 11)

# Awakened Units for Set 1

var rareHogs = registerNew(Rarity.Rarity.RARE, '30-50 Feral Hogs', 1, 1, 6, 2, 2, 2, 10, 10, 10, 'Earth', 'N/A', '+10% attack in combat', 0, 0, 0, 0, 0, false)
var superRareGuy = registerNew(Rarity.Rarity.SUPER_RARE, 'Super Guy', 1, 1, 6, 2, 2, 2, 10, 10, 10, 'Wind', 'N/A', '+10% attack in combat', 0, 0, 0, 0, 0, false)
var legendaryRareHotdog = registerNew(Rarity.Rarity.LEGENDARY_RARE, 'Hotdog Supreme', 1, 1, 6, 150, 100, 100, 18, 11, 9, 'Water', '[Inspiration] - All Allies +100% Health, Attack, and Defense in combat', '[Imagine this!] - +50% Damage Reduction and 2 Guaranteed Additional Attacks', 50, 0, 0, 0, 200, false)
var ultraRareUchihaAkira = registerNew(Rarity.Rarity.ULTRA_RARE, 'Uchiha Akira [Chuunin]', 1, 1, 6, 60, 90, 75, 9, 14, 11, 'Fire', '[Natural-Born Leader] - All \'Uchiha\' Allies +20% Health in combat', '[Sharingan!] - +20% attack in combat, +30% chance to dodge enemy attacks', 0, 30, 20, 0, 0, false)

var rng = RandomNumberGenerator.new()

var rarities = {Rarity.Rarity.COMMON : 35,
				Rarity.Rarity.RARE: 45,
				Rarity.Rarity.SUPER_RARE: 19,
				Rarity.Rarity.ULTRA_RARE: 1}

func registerNew(character_Rarity, name, level, exp, stage, health, attack, defense, healthGrowth, attackGrowth, defenseGrowth, element, leaderSkill, passiveSkill, DMReduct, Dodge, DMBoost, Crit, AddChance, isSummonable, awakensInto = null):
	count+=1
	return register(unitTemplate.new(count, character_Rarity, name, level, exp, stage, health, attack, defense, healthGrowth, attackGrowth, defenseGrowth, element, leaderSkill, passiveSkill, DMReduct, Dodge, DMBoost, Crit, AddChance, isSummonable, awakensInto))

func register(template : unitTemplate):
	unitDict[template.characterID] = template
	return template

func getRandomTemplate() -> unitTemplate:
	var rarity = get_rarity()
	var filteredDict = unitDict.values().filter(func(o):
		return o.characterRarity == rarity && o.isSummonable == true)
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
