extends Spatial
var swipe_start = null
var swipe_end = null
var minimum_drag = 100
var fileName = "user://save_game"
var selected = loadData("selected")
var bought = loadData("bought")
var coin = loadData("coin")
var theme = loadData("theme")
onready var player_children_count = $Player.get_child(0).get_child_count()
onready var mesh = $Player.get_child(0)
var price_list = []
var name_list = []
export var player_list = {
						"Wood":0, "Watermelon":50, "Haha":150, 
						"Basketball":300, "Softball":500, "Tennis Ball":800, 
						"Beach Ball":1200, "Pool Ball":1700, "Football":2500, "Earth":3000
}
var swipe_selected = selected


func _ready():
	for value in player_list.values():
		price_list.append(value)
	for key in player_list:
		name_list.append(key)
	$Camera.environment = $"/root/Vars".bgArray[theme]
	$CenterTop/Name.text = str(name_list[swipe_selected])
	$Coin/Label.text = "Cube: " + str(coin)
	mesh.get_child(selected).show()
	

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
	if swipe_start.y <= 350 and swipe_start.y >= 100:
		if abs(swipe.x) > minimum_drag:
			if swipe.x > 0:
				swipe("right")
			else:
				swipe("left")

func _physics_process(delta):
	if swipe_selected == selected:
		$CenterBottom/BuyButton/Label.text = "Selected"
	elif swipe_selected in bought:
		$CenterBottom/BuyButton/Label.text = "Select"
	else:
		$CenterBottom/BuyButton/Label.text = str(price_list[swipe_selected]) + " cube"
	$Player.rotate_y(0.01)
	
func swipe(param):
	mesh.get_child(swipe_selected).hide()
	if param == "right":
		if swipe_selected > 0:
			swipe_selected -= 1
		else:
			swipe_selected = player_children_count-1
	else:
		if swipe_selected < player_children_count-1:
			swipe_selected += 1
		else:
			swipe_selected = 0
	mesh.get_child(swipe_selected).show()
	$CenterTop/Name.text = str(name_list[swipe_selected]) 
		
func save():
	var bestScore = loadData("best_score")
	var file = File.new()
	file.open(fileName, File.WRITE)
	var content = {
		"best_score": int(bestScore),
		"coin": coin,
		"selected": selected,
		"bought": bought,
		"theme": theme
	}
	file.store_var(content)
	file.close()
	
func loadData(param):
	var get = File.new()
	get.open(fileName, File.READ)
	var result = get.get_var()
	get.close()
	return result[param]

func _on_Button_button_down():
	get_tree().change_scene("res://Main.tscn")


func _on_BuyButton_button_down():
	if swipe_selected in bought: #If player is bought
		selected = swipe_selected
		save()
	else:
		if coin >= price_list[swipe_selected]:
			coin -= price_list[swipe_selected]
			bought.append(swipe_selected)
			save()
			$Coin/Label.text = "Cube: " + str(coin)
		else:
			print("duit kurang")
