extends Node2D

var is_area = false
var is_paused = false
var action = ""

func _ready():
	$What.text = ""
	$Opcao.hide()


# warning-ignore:unused_argument
func _process(delta):
	#var mouse_position = get_global_mouse_position()
	#var direction = (mouse_position - position).normalized()
	
	if Input.is_action_just_pressed("ui_cancel"):
		is_paused = true
		$Opcao.show()
	
	$Player.position = get_global_mouse_position()
	$What.text = action
	
	if Input.is_action_just_pressed("mouse_click") and !is_paused:
		if is_area:
			if $Cama.visible:
				$Cama.hide()
				$Quadro.show()
				is_area = false
				action = ""
			elif $Quadro.visible:
				$Quadro.hide()
				$Corredor.show()
				is_area = false
				action = ""
			elif $Corredor.visible:
				$Corredor.hide()
				$Porta.show()
				is_area = false
				action = ""
			else:
				$Porta.hide()
				$Cama.show()
				is_area = false
				action = ""


# warning-ignore:unused_argument
func _on_Area_area_entered(area):
	if $Cama.visible:
		is_area = true
		action = "levantar"


# warning-ignore:unused_argument
func _on_Area_area_exited(area):
	if $Cama.visible:
		is_area = false
		action = ""


# warning-ignore:unused_argument
func _on_quadro_area_exited(area):
	if $Quadro.visible:
		is_area = false
		action = ""


# warning-ignore:unused_argument
func _on_quadro_area_entered(area):
	if $Quadro.visible:
		is_area = true
		action = "sair"


# warning-ignore:unused_argument
func _on_corredor_area_entered(area):
	if $Corredor.visible:
		is_area = true
		action = "aproximar"


# warning-ignore:unused_argument
func _on_corredor_area_exited(area):
	if $Corredor.visible:
		is_area = false
		action = ""


# warning-ignore:unused_argument
func _on_porta_area_entered(area):
	if $Porta.visible:
		is_area = true
		action = "abrir"


# warning-ignore:unused_argument
func _on_porta_area_exited(area):
	if $Porta.visible:
		is_area = false
		action = ""


func _on_Sim_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Nao_pressed():
	$Opcao.hide()
	is_paused = false
