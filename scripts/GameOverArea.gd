extends Area

onready var player = get_parent().get_node("Player")

func _physics_process(delta):
	if player.translation.y > -5:
		translation.z = player.translation.z
		translation.x = player.translation.x


func _on_GameOverArea_body_entered(body):
	get_parent().game_over()
