extends CanvasLayer

#var is_paused = false

func _ready():
	set_visible(false)

func set_visible(is_visable):
	for node in get_children():
		node.visible = is_visable
	pause(is_visable)

func pause(is_paused):
	get_tree().paused = is_paused
