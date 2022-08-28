extends Spatial

var theme

func _ready():
	theme = loadData("theme")
	get_node("Control/Theme-"+str(theme)).get_child(1).show()
	$Camera.environment = $"/root/Vars".bgArray[theme]
	
var fileName = "user://save_game.save"

func save():
	var selected = loadData("selected")
	var bought = loadData("bought")
	var coin = loadData("coin")
	var bestScore = loadData("best_score")
	var file = File.new()
	file.open(fileName, File.WRITE)
	var content = {
		"best_score": bestScore,
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




func _on_Theme0_button_down():
	get_node("Control/Theme-"+str(theme)).get_child(1).hide()
	theme = 0
	get_node("Control/Theme-"+str(theme)).get_child(1).show()
	$Camera.environment = $"/root/Vars".bgArray[theme]
	save()


func _on_Theme1_button_down():
	get_node("Control/Theme-"+str(theme)).get_child(1).hide()
	theme = 1
	get_node("Control/Theme-"+str(theme)).get_child(1).show()
	$Camera.environment = $"/root/Vars".bgArray[theme]
	save()


func _on_Theme2_button_down():
	get_node("Control/Theme-"+str(theme)).get_child(1).hide()
	theme = 2
	get_node("Control/Theme-"+str(theme)).get_child(1).show()
	$Camera.environment = $"/root/Vars".bgArray[theme]
	save()


func _on_Theme3_button_down():
	get_node("Control/Theme-"+str(theme)).get_child(1).hide()
	theme = 3
	get_node("Control/Theme-"+str(theme)).get_child(1).show()
	$Camera.environment = $"/root/Vars".bgArray[theme]
	save()


func _on_Theme4_button_down():
	get_node("Control/Theme-"+str(theme)).get_child(1).hide()
	theme = 4
	get_node("Control/Theme-"+str(theme)).get_child(1).show()
	$Camera.environment = $"/root/Vars".bgArray[theme]
	save()


func _on_Theme5_button_down():
	get_node("Control/Theme-"+str(theme)).get_child(1).hide()
	theme = 5
	get_node("Control/Theme-"+str(theme)).get_child(1).show()
	$Camera.environment = $"/root/Vars".bgArray[theme]
	save()


func _on_Back_button_down():
	get_tree().change_scene("res://Main.tscn")


func _on_Theme6_button_down():
	get_node("Control/Theme-"+str(theme)).get_child(1).hide()
	theme = 6
	get_node("Control/Theme-"+str(theme)).get_child(1).show()
	$Camera.environment = $"/root/Vars".bgArray[theme]
	save()


func _on_Theme7_button_down():
	get_node("Control/Theme-"+str(theme)).get_child(1).hide()
	theme = 7
	get_node("Control/Theme-"+str(theme)).get_child(1).show()
	$Camera.environment = $"/root/Vars".bgArray[theme]
	save()
