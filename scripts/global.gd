extends Node



func fullscreen():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_button_pressed() -> void:
	$mesaj/mesajI.text=""
	$mesaj.visible=true
	#for i in range(mesaj.length()):
		#$mesaj/mesajI.text+=mesaj[i]
		#await get_tree().create_timer(hız).timeout
	await get_tree().create_timer(5).timeout
	$mesaj.visible=false
