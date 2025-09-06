extends Node2D

var speed = 1250

func _process(delta: float) -> void:
		$RightCurtain.translate(Vector2(speed*delta,0))
		$LeftCurtain.translate(Vector2(-speed*delta,0))
		speed -= 20
		if speed <= 0:
			queue_free()
