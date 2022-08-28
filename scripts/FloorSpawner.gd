extends Node

var floor_object = preload("res://objects/Floor.tscn") 
var last_child
var x_pos
var z_pos

func _ready():
	var first_floor = [-4,-8,-12,-16,-20]
	
	for i in first_floor:
		var nodeInstance = floor_object.instance()
		nodeInstance.translate(Vector3(0,0,i))
		add_child(nodeInstance)


func spawn_floor():
	randomize()
	var last_child = get_child(get_child_count()-1)
	var z_pos = last_child.translation.z
	var x_pos = last_child.translation.x
	var random_value = round(rand_range(0,1))
	var nodeInstance = floor_object.instance()
	if random_value == 1:
		nodeInstance.translate(Vector3(x_pos,-2,z_pos - 4))
	else:
		nodeInstance.translate(Vector3(x_pos - 4,-2,z_pos))
	add_child(nodeInstance)
	
	
	


