extends Sprite3D

func _process(delta):
	rotate_z(deg_to_rad(-50*delta))
