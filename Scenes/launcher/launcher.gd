extends Node

func _ready():
	$RightCurtain/Label.text = "A"
	
	
var idable = true

func _input(event):
	if event is InputEventKey and event.is_pressed() and !event.is_echo():
		var char = event.keycode
		if 65 <= char and char <= 90 and idable:
			var id = OS.get_keycode_string(char)
			Global.id = id
			$RightCurtain/Label.text = id
		elif char == 32:
			Global.play_sound(preload("res://Assets/sfx/start.wav"))
			await get_tree().create_timer(3).timeout
			idable = false
			countdown()
			
			
func countdown():
	var stage = "stage"+str(Global.selected)+"/"+"stage"+str(Global.selected)+".tscn"
	get_tree().change_scene_to_file("res://Scenes/"+stage)
		
