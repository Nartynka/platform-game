extends Area2D

export(String, FILE, "*.tscn, *.scn") var target_scene

var is_near=false

func _input(event):
	if event.is_action_pressed("action"):
		print("pressed")
		if !target_scene: # is null
			print("no scene in this door")
			return
		if is_near:
			print("changing")
			get_tree().change_scene(target_scene)
			is_near = false

func _on_Door_body_entered(body):
	if body.name == "Player":
		is_near = true

func _on_Door_body_exited(body):
	if body.name == "Player":
		is_near = false
