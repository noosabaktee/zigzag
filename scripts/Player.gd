extends RigidBody
export var speed = 0.15
var swipe_start = null
var swipe_end = null
var capncrunch = Vector3()
var jump = 5
var minimum_drag = 100
var move = "right"
var is_jump = false
var on_floor = false
var floorSpawnerChild
var bodyIndex
var floor_shader = preload("res://floor_entered.tres") 
var current_rotate
var selected
var lastRotateX
var lastRotateZ

func _ready():
	var selectedNumber = get_parent().loadData("selected")
	selected = get_child(0).get_child(selectedNumber)
	selected.show()

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
		  swipe_start = event.get_position()
		else:
		  _calculate_swipe(event.get_position())


func _calculate_swipe(swipe_end):
	if swipe_start == null: 
		return
	var swipe = swipe_end - swipe_start
	if abs(swipe.x) > minimum_drag:
		if swipe.x > 0:
			get_parent().add_score()
			move = "right"
		else:
			get_parent().add_score()
			move = "left"
		lastRotateX = selected.rotation.x
		lastRotateZ = selected.rotation.z

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		move = "right"
	elif Input.is_action_pressed("ui_left"):
		move = "left"
	else:
		lastRotateX = selected.rotation.x
		lastRotateZ = selected.rotation.z

		
	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
		get_parent().add_score()
	
	if on_floor:
		if move == "right":
			translation.z -= speed
			selected.rotate_x(-speed)
		else:
			translation.x -= speed	
			selected.rotate_z(speed)
						
func _on_Player_body_entered(body):
	on_floor = true
	body.change_color()
	floorSpawnerChild = body.get_parent().get_child_count()
	bodyIndex = body.get_index()
	if bodyIndex >= floorSpawnerChild - 6:
		body.get_parent().spawn_floor()
		body.get_parent().get_parent().get_node("CoinSpawner").spawn_coin()
	body.down = true

func _on_Player_body_exited(body):
	on_floor = false



