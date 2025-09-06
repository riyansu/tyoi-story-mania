extends Node2D

@onready var cursor: Node2D = $Cursor
var SPEED = 900
var enabled = false
var pos = Vector2(0,0)

func _process(delta: float) -> void:
	if enabled:
		var acc = Global.wiimote2.get_accel()
		if (30 < cursor.global_position.x and acc.x < 0) or (cursor.global_position.x < 1125 and 0 < acc.x):
			cursor.global_position.x -= -acc.x * delta * SPEED
		if (30 < cursor.global_position.y and acc.y < 0) or (cursor.global_position.y < 625 and 0 < acc.y):
			cursor.global_position.y -= -acc.y * delta * SPEED
		pos = cursor.global_position
			
func start():
	enabled = true
	Global.wiimote2.set_motion_sensing(true)
	
func finish():
	enabled = false
	Global.wiimote2.set_motion_sensing(false)
