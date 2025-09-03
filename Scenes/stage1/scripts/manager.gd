extends Node3D

func _ready():
	await get_tree().create_timer(5).timeout
	Global.score = 5000
	$CurtainClose.close()
