extends Node2D

var yaz
var yazılan
var sahne

func mesajcı(mesaj):
	$CanvasLayer/Sprite2D/Panel/Button.disabled=true
	$AudioStreamPlayer.play()
	$CanvasLayer/Sprite2D/Panel/Label.text=""
	for i in mesaj.length():
			$CanvasLayer/Sprite2D/Panel/Label.text+=mesaj[i]
			await get_tree().create_timer(0.02).timeout
	$AudioStreamPlayer.stop()
	$CanvasLayer/Sprite2D/Panel/Button.disabled=false

func _ready() -> void:
	ResourceLoader.load_threaded_request("res://oyun.tscn")
	$CanvasLayer/Sprite2D/Panel/Button/Label.text="başla"

func _on_button_pressed() -> void:
	$CanvasLayer/Sprite2D/Panel/Button/Label.text="devam"
	yaz = true
	$CanvasLayer/Sprite2D/Panel/Label.text=""
	if yazılan == null:
		mesajcı(Hikaye.mesaj1)
		yazılan = "mesaj1"
		yaz = false
	elif yazılan == "mesaj1" and yaz:
		mesajcı(Hikaye.mesaj2)
		yazılan = "mesaj2"
		yaz = false
	elif yazılan == "mesaj2" and yaz:
		mesajcı(Hikaye.mesaj3)
		yazılan = "mesaj3"
		yaz = false
	elif yazılan == "mesaj3" and yaz:
		mesajcı(Hikaye.mesaj4)
		yazılan = "mesaj4"
		yaz = false
	elif yazılan == "mesaj4" and yaz:
		mesajcı(Hikaye.mesaj5)
		yazılan = "mesaj5"
		yaz = false
	elif yazılan == "mesaj5" and yaz:
		mesajcı(Hikaye.mesaj6)
		yazılan = "mesaj6"
		yaz = false
	elif yazılan == "mesaj6" and yaz:
		mesajcı(Hikaye.mesaj7)
		yazılan = "mesaj7"
		yaz = false
	elif yazılan == "mesaj7" and yaz:
		mesajcı(Hikaye.mesaj8)
		yazılan = "mesaj8"
		yaz = false
	elif yazılan == "mesaj8":
		get_tree().change_scene_to_packed(sahne)


func _process(_delta):
	var durum = ResourceLoader.load_threaded_get_status("res://oyun.tscn")
	if durum == ResourceLoader.THREAD_LOAD_LOADED:
		sahne = ResourceLoader.load_threaded_get("res://oyun.tscn")
		
