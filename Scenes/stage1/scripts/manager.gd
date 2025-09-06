extends Node3D

@export var woody:PackedScene
@export var jessie:PackedScene
@export var bullseye:PackedScene


func _ready():
	$Pointer.start()
	$Pointer2.start()
	woody_party()
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
			if obj.name == "Woody3D":
				Global.score+=100
			if obj.name == "Jessie3D":
				Global.score+=300
			if obj.name == "Bullseye3D":
				Global.score+=600
				bullseye_counter += 1
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
		if obj.name == "Woody3D":
			Global.score+=100
		if obj.name == "Jessie3D":
			Global.score+=300
		if obj.name == "Bullseye3D":
			Global.score+=600
			bullseye_counter += 1
			#print(result.collider.name)
		
var bullseye_counter = 2;
func woody_party():
	var i = woody.instantiate()
	var j = jessie.instantiate()
	var k = bullseye.instantiate()
	add_child(i)
	add_child(j)
	if bullseye_counter > 0:
		add_child(k)
		bullseye_counter -= 1
	i.global_position = Vector3(-20,-4,-16)
	j.global_position = Vector3(20,0,-10)
	k.global_position = Vector3(-4.5+randi_range(0,1)*8,1.5,-10)
	await get_tree().create_timer(3).timeout
	woody_party()
