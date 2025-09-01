extends Node

func _ready():
	$Label.text = "A"

func _input(event):
	if event is InputEventKey and event.is_pressed() and !event.is_echo():
		var char = event.keycode
		if 65 <= char and char <= 90:
			var id = OS.get_keycode_string(char)
			Global.id = id
			$Label.text = id
		elif char == 32:
			var stage = "stage"+str(Global.selected)+"/"+"stage"+str(Global.selected)+".tscn"
			get_tree().change_scene_to_file("res://Scenes/"+stage)
	
