extends Control

func _process(delta):
	$Label.text = "Monety: " + String(Inventory.get_item("Gold Coin"))
