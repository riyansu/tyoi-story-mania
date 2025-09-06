extends Node3D

var i = 0
func _process(delta: float) -> void:
	i+=0.1
	translate(Vector3(0,cos(i)*delta*20,0))
