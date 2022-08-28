extends Area

onready var coinLabel = get_parent().get_parent().get_node("Coin/Label")
onready var getCoin = get_parent().get_parent().loadData("coin")
onready var player = get_parent().get_parent().get_node("Player")
var coinText = preload("res://objects/CoinText.tscn") 
var coinTextInstance

func _ready():
	coinTextInstance = coinText.instance()
	coinTextInstance.translate(Vector3(0,0.3,0))
	add_child(coinTextInstance)
	coinTextInstance.visible = false
	
func _physics_process(delta):
	$MeshInstance.rotation.y += 0.05
	# If player don't touch coin 
	if player.translation.z < (translation.z - 10) and \
	 	player.translation.x < (translation.x - 10):
		spawn(false)

func _on_Coin_body_entered(body):
	if body.on_floor == true:
		$MeshInstance.hide()
		coinTextInstance.visible = true
		get_parent().get_parent().add_coin()
		coinLabel.text = "Cube: " + str(getCoin + get_parent().get_parent().cube)
		var t = Timer.new()
		t.set_wait_time(1)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		t.queue_free()
		spawn(false)
		$MeshInstance.show()
		coinTextInstance.visible = false		

func spawn(param):
	self.visible = param
	


