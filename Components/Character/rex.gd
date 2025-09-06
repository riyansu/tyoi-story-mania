extends Node3D

var i = 0
func _process(delta: float) -> void:
	i+=0.02
	translate(Vector3(cos(i)*delta*7,sin(i)*delta*20,0))
	translate(Vector3(5*delta,0,0))
