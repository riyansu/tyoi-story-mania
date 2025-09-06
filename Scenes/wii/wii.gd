extends Control

var connection_thread := Thread.new()
var connection_complete := false
var SPEED = 1500
@onready var cursor: Node2D = $Pointer

func _on_back_button_down():
	Global.wiimote.set_motion_sensing(false)
	Global.wiimote2.set_motion_sensing(false)
	get_tree().change_scene_to_file("res://Scenes/select/select.tscn")

func _ready() -> void:
	connection_thread.start(Callable(self, "_thread_connect_wiimotes"))
	
func _thread_connect_wiimotes():
	# assigns wiiuse structures
	GDWiimoteServer.connect_wiimotes()
	connection_complete = true
	call_deferred("_on_connection_complete")

func _on_connection_complete():
	# allocate GDWiimote objects
	var wiimotes = GDWiimoteServer.finalize_connection()
	Global.wiimote = GDWiimoteServer.get_connected_wiimotes()[0]
	Global.wiimote2 = GDWiimoteServer.get_connected_wiimotes()[1]
	Global.wiimote.set_motion_sensing(true)
	$Pointer.enabled = true
	Global.wiimote2.set_motion_sensing(true)
	$Pointer2.enabled = true
