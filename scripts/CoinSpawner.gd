extends Node

var coin_object = preload("res://objects/Coin.tscn") 
var last_child 
var coin
var x_pos
var z_pos
var floorSpawner
var coinInstance 

func _ready():
	floorSpawner =  get_parent().get_node("FloorSpawner")
	coin = $Coin

func spawn_coin():
	randomize()
	if round(rand_range(0,2)) == 1:
	#	Get last floor object
		last_child = floorSpawner.get_child(floorSpawner.get_child_count()-1)
	#	Get last position X & Z
		x_pos = last_child.translation.x
		z_pos = last_child.translation.z
	#	Instancing object
		if !coin.is_visible():
			coin.translation = Vector3(x_pos,2,z_pos)
			coin.spawn(true)
		











