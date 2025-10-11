extends BasePage

var game_board = []
var board_width = 5
var board_height = 1

func _ready():
	# Create a 3x3 game board filled with empty strings
	for y in board_height:
		game_board.append([])
		for x in board_width:
			game_board[y].append("")
	_getWidth()

	# Set a value at a specific position
	game_board[0][1] = "X"

	# Print the board
	for y in board_height:
		print(game_board[y])
	

func _getWidth():
	var test = PlayerDataContainer.playerData.characterBox[PlayerDataContainer.playerData.characterbox.size()-1]
	print(test)


func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
