extends Node3D

func _process(delta: float) -> void:
	translate(Vector3(5*delta,0,0))
