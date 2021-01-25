extends Node2D

var coins

func _ready():
	coins = 0


func _physics_process(delta):
	if coins == 3:
		get_tree().change_scene("res://Level1.tscn")


func _on_Coin_coin_collected():
	coins += 1
	$HUD.set_coins(coins)
