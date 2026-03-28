extends Node

var motorS = ""
var YDÜS = ""


func fullscreen():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _physics_process(_delta) -> void:
	if Input.is_action_just_pressed("F11"):
		Global.fullscreen()

func _on_button_pressed() -> void:
	$mesaj/mesajI.text=""
	$mesaj.visible=true
	#for i in range(mesaj.length()):
		#$mesaj/mesajI.text+=mesaj[i]
		#await get_tree().create_timer(hız).timeout
	await get_tree().create_timer(5).timeout
	$mesaj.visible=false
	
