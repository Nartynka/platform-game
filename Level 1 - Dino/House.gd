extends Node2D

func _on_House_body_entered(body):
	if body.name == "Player":
		$"Door-opened".visible = true

func _on_House_body_exited(body):
	if body.name == "Player":
		$"Door-opened".visible = false
