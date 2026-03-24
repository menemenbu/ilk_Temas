extends Node


func _on_başla_pressed() -> void:
	ResourceLoader.load_threaded_request("res://oyun.tscn")

func _process(_delta):
	var durum = ResourceLoader.load_threaded_get_status("res://oyun.tscn")
	if durum == ResourceLoader.THREAD_LOAD_LOADED:
		var sahne = ResourceLoader.load_threaded_get("res://oyun.tscn")
		get_tree().change_scene_to_packed(sahne)


func _on_çıkış_pressed() -> void:
	get_tree().quit()

func fullscreen():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _physics_process(_delta) -> void:
	if Input.is_action_just_pressed("F11"):
		fullscreen()
