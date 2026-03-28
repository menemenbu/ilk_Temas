extends Node2D

var Cbit
var MesajS = 0
var hız = 10
var ses= true
 
func okuma():
	$CanvasLayer/Panel2/mesaj/cevap1.visible=false
	$CanvasLayer/Panel2/mesaj/cevap2.visible=false
	$CanvasLayer/Panel2/mesaj/devam.visible=true

func seçim():
	$CanvasLayer/mesaj/cevap1.visible=true
	$CanvasLayer/mesaj/cevap2.visible=true
	$CanvasLayer/mesaj/devam.visible=false

func mesajcı(mesaj):
	$CanvasLayer/Panel2/mesaj/cevap1.disabled=true
	$CanvasLayer/Panel2/mesaj/cevap2.disabled=true
	$CanvasLayer/Panel2/mesaj/devam.disabled=true
	$AudioStreamPlayer.play()
	$CanvasLayer/Panel2/mesaj/mesajI.text=""
	for i in mesaj.length():
			$CanvasLayer/Panel2/mesaj/mesajI.text+=mesaj[i]
			await get_tree().create_timer(0.04).timeout
	$AudioStreamPlayer.stop()
	$CanvasLayer/Panel2/mesaj/cevap1.disabled=false
	$CanvasLayer/Panel2/mesaj/cevap2.disabled=false
	$CanvasLayer/Panel2/mesaj/devam.disabled=false

func _ready() -> void:
	$"CanvasLayer/Panel/menü/Label/ses".button_pressed=true
	$CanvasLayer/Panel2.visible=false
	#Cbit = true
	$CanvasLayer/Panel2/mesaj/mesajI.text=""
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
		mesajcı(Hikaye.mesaj3)
		Cbit = false
		await get_tree().create_timer(5).timeout
	
	if ses == false:
		$AudioStreamPlayer.stop()
	else:pass


func _on_cevap_2_pressed() -> void:
	$CanvasLayer/Panel2/mesaj/mesajI.text=""
	mesajcı(Hikaye.mesaj3)


func _on_ekran_pressed() -> void:
	$CanvasLayer/Panel2.visible=true


func _on_check_box_toggled(_button_pressed) -> void:
	ses = false


func _on_kapa_pressed() -> void:
	$CanvasLayer/Panel2.visible=false


func _on_ekran_2_pressed() -> void:
	$CanvasLayer/Panel3.visible=true
