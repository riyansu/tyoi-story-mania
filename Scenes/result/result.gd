extends Node2D

var score = 0
var ok = false
func _process(delta):
	if score < Global.score:
		score+=100
		$Label2.text=str(score)
	elif not ok:
		Global.send_score()
		ok = true
		await get_tree().create_timer(5).timeout
		if Global.selected==3:
			get_tree().change_scene_to_file("res://Scenes/finalresult/finalresult.tscn")
		else:
			Global.reset()
			get_tree().change_scene_to_file("res://Scenes/launcher/launcher.tscn")
