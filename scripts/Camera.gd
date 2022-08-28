extends Camera
onready var player = get_node("/root/Main/Player")

func _process(delta):
	if player.translation.y > -5:
		translation.z = player.translation.z + 10
		translation.x = player.translation.x + 10
