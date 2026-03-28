extends Node2D

var Cbit = false
var MesajS = 0
 
func _ready() -> void:
	$CanvasLayer/mesaj/mesajI.text=""
	$CanvasLayer/Panel.visible=false

func _on_menü_pressed() -> void:
	$CanvasLayer/Panel.visible=true


func _on_devam_et_pressed() -> void:
	$CanvasLayer/Panel.visible=false


func _on_don_pressed() -> void:
	ResourceLoader.load_threaded_request("res://Amenü.tscn")

func _process(_delta) -> void:
	var durum = ResourceLoader.load_threaded_get_status("res://Amenü.tscn")
	if durum == ResourceLoader.THREAD_LOAD_LOADED:
		var sahne = ResourceLoader.load_threaded_get("res://Amenü.tscn")
		get_tree().change_scene_to_packed(sahne)
	if Input.is_action_just_pressed("F11"):
		Global.fullscreen()
	
	if Cbit == true:
		MesajS+=1
		for i in range(Hikaye.mesaj1.length()):
			$CanvasLayer/mesaj/mesajI.text+=Hikaye.mesaj1[i]
