extends KinematicBody2D

export (int) var speed = 200
export (int) var jump_speed = -1200
export (int) var gravity = 4000

onready var animationPlayer = $AnimationPlayer

var velocity = Vector2.ZERO
var new_anim = "idle"

func _ready():
	randomize()
	PlayerStats.connect("no_health", self, "respawn")


func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		new_anim = "move_right"
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		new_anim = "move_left"
		velocity.x -= speed

func _physics_process(delta):
	new_anim = "idle"
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = jump_speed
#	animationPlayer.play(new_anim)


func respawn():
	position = Vector2(130, 456)
	PlayerStats.health = PlayerStats.max_health

func play_walkin_anim():
	print("playing")
	animationPlayer.play("walk_in")
