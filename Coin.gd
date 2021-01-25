extends Area2D

signal coin_collected

func _on_Coin_body_entered(body):
	set_collision_mask_bit(0, false)
	emit_signal("coin_collected")
	$AnimationPlayer.play("Bounce")


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
