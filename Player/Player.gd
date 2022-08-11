extends KinematicBody2D

export (int) var speed = 200
export (int) var jump_speed = -1200
export (int) var gravity = 4000

var velocity = Vector2.ZERO
var new_anim = "Idle"

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		new_anim = "MoveRight"
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		new_anim = "MoveLeft"
		velocity.x -= speed

func _physics_process(delta):
	new_anim = "Idle"
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = jump_speed
	$AnimationPlayer.play(new_anim)
