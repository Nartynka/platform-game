extends Area2D

var dmg = 1

func _on_body_entered(body):
	if body.name == "Player":
		PlayerStats.health -= dmg
		body.velocity.y = body.jump_speed
