extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var down = false


# Called when the node enters the scene tree for the first time.
func _ready():
	var theme = get_parent().get_parent().loadData("theme")
	var mat = SpatialMaterial.new()
	mat.albedo_color = $"/root/Vars".color[theme]
	get_node("MeshInstance").material_override = mat


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if translation.y <= -5:
		queue_free()
	
	if translation.y < 0 and down == false:
		translation.y += 0.1
	elif down == true:
		var t = Timer.new()
		t.set_wait_time(0.8)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		t.queue_free()
		translation.y -= 0.1
		
func change_color():
#	var mat = preload("res://floor_entered.tres")
	var theme = get_parent().get_parent().loadData("theme")
	var mat = SpatialMaterial.new()
	mat.albedo_color = $"/root/Vars".color2[theme]
	var t = Timer.new()
	t.set_wait_time(0.8)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	get_node("MeshInstance").material_override = mat





