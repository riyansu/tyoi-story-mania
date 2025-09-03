extends Node2D

var score = 0
func _process(delta):
	if score < Global.score:
		score+=100
		$Label2.text=str(score)
	else:
		Global.send_score()
		await get_tree().create_timer(5).timeout
		get_tree().change_scene_to_file("res://Scenes/launcher/launcher.tscn")
