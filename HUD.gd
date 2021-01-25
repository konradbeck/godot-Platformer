extends CanvasLayer

func _ready():
	set_coins(0)


func set_coins(value):
	$Panel/HBoxContainer/Coins.text = str(value)
