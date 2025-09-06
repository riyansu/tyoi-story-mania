extends Node3D

var i = 0
func _process(delta: float) -> void:
	i+=0.1
	translate(Vector3(-10*delta,cos(i)*delta*10,0))
