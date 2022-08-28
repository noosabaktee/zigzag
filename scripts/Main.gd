extends Spatial
var score = 0
var cube = 0
var fileName = "user://save_game.save"
var coin
var bestScore 
var theme
var resume_btn = preload("res://ui/Resume.png")
var pause_btn = preload("res://ui/Pause.png")



func _init():
	var file = File.new()
	if !file.file_exists(fileName):
		file.open(fileName, File.WRITE)
		var content = {
			"best_score": 0,
			"coin": 0,
			"selected": 0,
			"bought": [0],
			"theme": 0
		}
		file.store_var(content)
		file.close()

func _ready():
	coin = loadData("coin")
	bestScore = loadData("best_score") 
	theme = loadData("theme")
	$Camera.environment = $"/root/Vars".bgArray[theme]
	if $"/root/Vars".first:	
		get_tree().paused = true
	else:	
		$CenterControl/PlayButton.hide()
		$CenterControl/Button.hide()
		$CenterControl/BestScore.hide()
		$Pause.show()

		
	$CenterControl/BestScore/Label.text = "Best Score: " + str(bestScore)
	$Coin/Label.text = "Cube: " + str(coin + cube)
		
func game_over():
	save()
	$"/root/Vars".first = false
	$CenterControl/BestScore/Label.text = "Best Score: " + str(bestScore)
	$CenterControl/RestartButton.show()
	$CenterControl/BestScore.show()
	$CenterControl/Button.show()
	$Pause.hide()
	
func add_score():
	if $Player.on_floor == true:
		score += 1
		$CenterControl/Score.text = str(score)
		
func add_coin():
	cube += 1
	$Coin/Label.text = "Cube: " + str(cube)

func _on_PlayButton_button_down():
	$CenterControl/BestScore.hide()
	$CenterControl/Button.hide()
	$CenterControl/PlayButton.hide()
	$Pause.show()
	get_tree().paused = false

func _on_RestartButton_button_down():
	$CenterControl/BestScore.hide()
	$CenterControl/Button.hide()
	$CenterControl/RestartButton.hide()
	$Pause.show()
	get_tree().reload_current_scene()
	
func save():
	var selected = loadData("selected")
	var bought = loadData("bought")
	coin += cube
	if score > int(bestScore):
		bestScore = score
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
	$"/root/Vars".first = true
	get_tree().paused = false
	get_tree().change_scene("res://Buy.tscn")


func _on_PauseButton_button_down():
	if get_tree().paused:
		_on_ResumeButton_button_down()
	else:
		get_tree().paused = true
		$Pause/PauseButton.icon = resume_btn
		$CenterControl/BestScore.show()
		$CenterControl/ResumeButton.show()


func _on_ResumeButton_button_down():
	get_tree().paused = false
	$Pause/PauseButton.icon = pause_btn
	$CenterControl/BestScore.hide()
	$CenterControl/ResumeButton.hide()


func _on_Exit_button_down():
	get_tree().quit()

func _on_Theme_button_down():
	$"/root/Vars".first = true
	get_tree().paused = false
	get_tree().change_scene("res://Theme.tscn")
