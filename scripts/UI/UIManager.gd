extends CanvasLayer

var PlayerElements := {}
# Called when the node enters the scene tree for the first time.
func _ready():
	create_elements() # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func create_elements():
	var premiumCurrencyLabel = Label.new()
	premiumCurrencyLabel.text = str(PlayerDataContainer.playerData.premiumCurrency)
	premiumCurrencyLabel.set_position(Vector2(488, 135))
	premiumCurrencyLabel.set("theme_override_colors/font_color", Color(0.39215687, 0.58431375, 0.92941177, 1))
	add_child(premiumCurrencyLabel)
	PlayerElements["premiumCurrency"] = premiumCurrencyLabel
	
	var freeCurrencyLabel = Label.new()
	freeCurrencyLabel.text = str(PlayerDataContainer.playerData.coinCurrency)
	freeCurrencyLabel.set_position(Vector2(500, 95))
	freeCurrencyLabel.set("theme_override_colors/font_color", Color(1, 0.84313726, 0,1.0))
	add_child(freeCurrencyLabel)
	PlayerElements["freeCurrency"] = freeCurrencyLabel
	
	
	

func _process(delta) -> void:
	PlayerElements["premiumCurrency"].text = str(PlayerDataContainer.playerData.premiumCurrency)
	PlayerElements["freeCurrency"].text = str(PlayerDataContainer.playerData.coinCurrency)
