extends Node2D

var MesajS = 0
var yazılan
var yaz=true
var ilk
var son
var belgetscn = load("res://belge1.tscn").instantiate()
var belgetscn2= load("res://belge2.tscn").instantiate()
var Abelge

func okuma():
	$CanvasLayer/Panel2/mesaj/cevap1.visible=false
	$CanvasLayer/Panel2/mesaj/cevap2.visible=false
	$CanvasLayer/Panel2/mesaj/devam.visible=true

func seçim():
	$CanvasLayer/Panel2/mesaj/cevap1.visible=true
	$CanvasLayer/Panel2/mesaj/cevap2.visible=true
	$CanvasLayer/Panel2/mesaj/devam.visible=false

func mesajcı(mesaj):
	$CanvasLayer/Panel2/mesaj/kapa.disabled=true
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
	$CanvasLayer/Panel2/mesaj/kapa.disabled=false

func _ready() -> void:
	ilk=true
	$CanvasLayer/iyiS.visible=false
	$"CanvasLayer/kötüS".visible=false
	$CanvasLayer/Panel3.visible=false
	$"CanvasLayer/ekran_mesajı2".visible=false
	$"CanvasLayer/ekran_mesajı".visible=true
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
	
	if Global.motorS=="Katı":
		if Global.YDÜS == "EMU":
			son="kötü"
		elif Global.YDÜS == "Orlan":
			son="kötü"
		elif Global.YDÜS == "EVA":
			son="kötü"
	elif Global.motorS=="Sıvı":
		if Global.YDÜS == "EMU":
			son="iyi"
		elif Global.YDÜS == "Orlan":
			son="kötü"
		elif Global.YDÜS == "EVA":
			son="iyi"
	elif Global.motorS=="iyon":
		if Global.YDÜS == "EMU":
			son="iyi"
		elif Global.YDÜS == "Orlan":
			son="kötü"
		elif Global.YDÜS == "EVA":
			son="iyi"
	
	if son=="iyi":
		$CanvasLayer/iyiS.visible=true
	elif son=="kötü":
		$"CanvasLayer/kötüS".visible=true



func _on_ekran_pressed() -> void:
	yaz=true
	$CanvasLayer/Panel3/kapat.disabled=true
	if ilk:
		mesajcı(Hikaye.mesaj8)
		yaz=false
		ilk=false
	if MesajS==1 and yaz:
		$CanvasLayer/Panel2/mesaj/cevap1.visible=true
		$CanvasLayer/Panel2/mesaj/cevap2.visible=true
		$CanvasLayer/Panel2/mesaj/devam.visible=true
		mesajcı(Hikaye.mesaj01)
		$CanvasLayer/Panel2/mesaj/cevap1.text="Sıvı Yakıtlı"
		$CanvasLayer/Panel2/mesaj/cevap2.text="İyon"
		$CanvasLayer/Panel2/mesaj/devam.text="Katı Yakıtlı"
		yaz=false
	elif MesajS==2 and yaz:
		$CanvasLayer/Panel2/mesaj/devam.text="devam"
		okuma()
		mesajcı(Hikaye.mesaj02)
	elif MesajS==3 and yaz:
		mesajcı(Hikaye.mesaj03)
	elif MesajS==4 and yaz:
		$CanvasLayer/Panel2/mesaj/cevap1.text="Etrafından Dolaş"
		$CanvasLayer/Panel2/mesaj/cevap2.text="Yoldan Sapma"
		seçim()
		mesajcı(Hikaye.mesaj04)
	elif MesajS==5 and yaz:
		$CanvasLayer/Panel2/mesaj/cevap1.text="EMU"
		$CanvasLayer/Panel2/mesaj/devam.text="Orlan"
		$CanvasLayer/Panel2/mesaj/cevap2.text="EVA"
		$CanvasLayer/Panel2/mesaj/devam.visible=true
		mesajcı(Hikaye.mesaj05)
	$"CanvasLayer/ekran_mesajı".visible=false
	$CanvasLayer/Panel2.visible=true
	$CanvasLayer/Panel3/kapat.disabled=false


func _on_kapa_pressed() -> void:
	var kapandı = false
	if not kapandı:
		$"CanvasLayer/ekran_mesajı2".visible=true
		kapandı = true
	$CanvasLayer/Panel2.visible=false


func _on_ekran_2_pressed() -> void:
	$CanvasLayer.layer=0
	$"CanvasLayer/ekran_mesajı2".visible=false
	$CanvasLayer/Panel3.visible=true


func _on_devam_pressed() -> void:
	$CanvasLayer/Panel2/mesaj/mesajI.text=""
	$CanvasLayer/Panel2.visible=false
	if MesajS==0:
		MesajS+=1
		#yaz=false
	elif MesajS==1:
		Global.motorS="Katı"
		MesajS+=1
		#yaz=false
	elif MesajS==2:
		MesajS+=1
	elif MesajS==3:
		MesajS+=1
	elif MesajS==5:
		
		Global.YDÜS = "Orlan"

func _on_cevap_1_pressed() -> void:
	$CanvasLayer/Panel2/mesaj/mesajI.text=""
	$CanvasLayer/Panel2.visible=false
	if MesajS==1:
		Global.motorS="Sıvı"
		MesajS+=1
	elif MesajS==4:
		
		MesajS+=1
	elif MesajS==5:
		
		Global.YDÜS = "EMU"

func _on_cevap_2_pressed() -> void:
	$CanvasLayer/Panel2/mesaj/mesajI.text=""
	$CanvasLayer/Panel2.visible=false
	if MesajS==1:
		Global.motorS="iyon"
		MesajS+=1
	elif MesajS==4:
		
		MesajS+=1
	elif MesajS==5:
		
		Global.YDÜS = "EVA"


func _on_kapat_pressed() -> void:
	$CanvasLayer.layer=1
	$CanvasLayer/Panel3.visible=false
