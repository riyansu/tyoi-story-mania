extends Node2D

var speed = 1250

var closed = false

func ready():
	hide()

func close():
	closed = true
	show()

func _process(delta: float) -> void:
	if closed:
		$RightCurtain.translate(Vector2(-speed*delta,0))
		$LeftCurtain.translate(Vector2(speed*delta,0))
		speed -= 20
		if speed <= 0:
			get_tree().change_scene_to_file("res://Scenes/result/result.tscn")
			queue_free()
