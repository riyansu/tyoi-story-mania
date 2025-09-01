extends Sprite3D

func _process(delta):
	translate(Vector3(-2*delta,0,0))
	if global_position.x < -20:
		global_position.x = 20
