extends Node2D

var Cbit
var MesajS = 0
var ses= true
var yazılan
var yaz=true

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
			await get_tree().create_timer(0.02).timeout
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
	$"CanvasLayer/dönüş".visible=false

func _on_menü_pressed() -> void:
	$CanvasLayer/Panel.visible=true


func _on_devam_et_pressed() -> void:
	$CanvasLayer/Panel.visible=false


func _on_don_pressed() -> void:
	$"CanvasLayer/dönüş".visible=true
	ResourceLoader.load_threaded_request("res://Amenü.tscn")

func _process(_delta) -> void:
	var durum = ResourceLoader.load_threaded_get_status("res://Amenü.tscn")
	if durum == ResourceLoader.THREAD_LOAD_LOADED:
		var sahne = ResourceLoader.load_threaded_get("res://Amenü.tscn")
		get_tree().change_scene_to_packed(sahne)
	
	if Cbit == true:
		mesajcı(Hikaye.yazı)
		Cbit = false
		await get_tree().create_timer(5).timeout
	
	if ses == false:
		$AudioStreamPlayer.stop()
	else:pass


func _on_ekran_pressed() -> void:
	$CanvasLayer/Panel2.visible=true


func _on_check_box_toggled(_button_pressed) -> void:
	ses = false


func _on_kapa_pressed() -> void:
	$CanvasLayer/Panel2.visible=false


func _on_ekran_2_pressed() -> void:
	$CanvasLayer/Panel3.visible=true


func _on_devam_pressed() -> void:
	yaz = true
	$CanvasLayer/Panel2/mesaj/mesajI.text=""
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



func _on_cevap_1_pressed() -> void:
	pass # Replace with function body.

func _on_cevap_2_pressed() -> void:pass
	#$CanvasLayer/Panel2/mesaj/mesajI.text=""
	#mesajcı(Hikaye.mesaj1)
