extends Node

func _ready() -> void:pass
#	print(Hikaye.mesaj1.length())

func _on_başla_pressed() -> void:
	ResourceLoader.load_threaded_request("res://oyun.tscn")

func _process(_delta):
	var durum = ResourceLoader.load_threaded_get_status("res://oyun.tscn")
	if durum == ResourceLoader.THREAD_LOAD_LOADED:
		var sahne = ResourceLoader.load_threaded_get("res://oyun.tscn")
		get_tree().change_scene_to_packed(sahne)


func _on_çıkış_pressed() -> void:
	get_tree().quit()
