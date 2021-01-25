extends KinematicBody2D

var velocity = Vector2(0, 0)
var coins = 0
const SPEED = 180
const GRAVITY = 35
const JUMPFORCE = -1100


func _physics_process(delta): # 60 times per second
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("idle")
		
	if not is_on_floor():
		$AnimatedSprite.play("air")
	
	velocity.y += GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x, 0, 0.2)


func _on_VisibilityNotifier2D_screen_exited():
	get_tree().change_scene("res://Level1.tscn")


func add_coin():
	coins += 1
