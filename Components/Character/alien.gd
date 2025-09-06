extends Node3D

var i = 0
func _process(delta: float) -> void:
	i+=0.2
	translate(Vector3(cos(i)*delta*20,10*delta,0))
