extends Control

onready var label = $HBoxContainer/CoinCount
func _ready():
	Inventory.connect("item_changed", self, "update_label")

func update_label(_new_value, _a, _b):
	label.text = String(Inventory.get_item("Gold Coin"))
