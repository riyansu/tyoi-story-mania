extends Node2D

var score = 0
var ok = false

func _ready():
	$Label2.text = str(int(Global.total))
	$Label5.text = str(int(Global.rank))
	await get_tree().create_timer(5).timeout
	Global.reset()
	get_tree().change_scene_to_file("res://Scenes/launcher/launcher.tscn")
