extends Node

func _on_button_1_button_down():
	Global.selected = 1
	start()

func _on_button_2_button_down():
	Global.selected = 2
	start()

func _on_button_3_button_down():
	Global.selected = 3
	start()

func _on_button_4_button_down():
	get_tree().change_scene_to_file("res://Scenes/wii/wii.tscn")

func start():
	print(Global.selected)
	get_tree().change_scene_to_file("res://Scenes/launcher/launcher.tscn")
