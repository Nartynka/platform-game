extends Area2D

export(PackedScene) var target_scene

var is_near=false
func _input(event):
	if event.is_action_pressed("action"):
		if !target_scene: # is null
			print("no scene in this door")
			return
		if is_near:
			print("changing")
			print(get_overlapping_bodies()[1])
			get_overlapping_bodies()[1].play_walkin_anim()
			$AnimationPlayer.play("open")
			is_near = false

func next():
	get_tree().change_scene_to(target_scene)

func _on_body_entered(body):
	if body.name == "Player":
		is_near = true

func _on_body_exited(body):
	if body.name == "Player":
		is_near = false
