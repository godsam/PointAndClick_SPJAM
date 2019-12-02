extends Node2D

func _ready():
	game_controler.GameStatus(0)
	$Panel.hide()

func _on_Close_pressed():
 	get_tree().quit()

func _on_Help_pressed():
	$Panel.show()

func _on_Start_pressed():
	var error = get_tree().change_scene("res://scenes/Cena1.tscn")
	
	if error != 0:
		print(error)


func _on_Button_pressed():
	$Panel.hide()
