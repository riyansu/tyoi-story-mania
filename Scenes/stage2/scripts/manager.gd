extends Node3D

@export var rex:PackedScene
@export var lotso:PackedScene
@export var alien:PackedScene


func _ready():
	$Pointer.start()
	$Pointer2.start()
	rex_party()
	await get_tree().create_timer(30).timeout
	$Pointer.finish()
	$Pointer2.finish()
	Global.play_sound(preload("res://Assets/sfx/finish.wav"))
	#Global.score = 5000
	$CurtainClose.close()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("A"):
		Global.wiimote.pulse_rumble(50)
		var from = $Camera3D.project_ray_origin($Pointer.pos)
		var to = $Camera3D.project_ray_normal($Pointer.pos)*1000
		var space_state = get_world_3d().direct_space_state
		var query = PhysicsRayQueryParameters3D.new()
		query.from = from
		query.to = to
		query.collide_with_areas = true
		query.collide_with_bodies = true
		var result = space_state.intersect_ray(query)
		if result:
			var obj = result.collider
			obj.get_parent().queue_free()
			Global.play_sound(preload("res://Assets/sfx/attack.mp3"))
			if obj.name == "Rex3D":
				Global.score+=500
			if obj.name == "Lotso3D":
				Global.score+=300
			if obj.name == "Alien3D":
				Global.score+=800
	var from = $Camera3D.project_ray_origin($Pointer2.pos)
	var to = $Camera3D.project_ray_normal($Pointer2.pos)*1000
	var space_state = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.new()
	query.from = from
	query.to = to
	query.collide_with_areas = true
	query.collide_with_bodies = true
	var result = space_state.intersect_ray(query)
	if result:
		var obj = result.collider
		obj.get_parent().queue_free()
		Global.play_sound(preload("res://Assets/sfx/attack.mp3"))
		if obj.name == "Rex3D":
			Global.score+=500
		if obj.name == "Lotso3D":
			Global.score+=300
		if obj.name == "Alien3D":
			Global.score+=800
	
	#print(result.collider.name)
		
func rex_party():
	var i = rex.instantiate()
	var j = lotso.instantiate()
	var k = alien.instantiate()
	add_child(i)
	add_child(j)
	add_child(k)
	i.global_position = Vector3(-20,0,-16)
	j.global_position = Vector3(20,0,-10)
	k.global_position = Vector3(randf_range(-10,10),-2,-10)
	await get_tree().create_timer(3).timeout
	rex_party()
