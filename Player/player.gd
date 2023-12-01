extends CharacterBody2D

const ACC = 5
const bulletPath = preload("res://Interactions/bullet.tscn")

@onready var lasergun = $RayCast2D


func _unhandled_input(event):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var bullet = bulletPath.instantiate()
	bullet.bVelocity = $Marker2D.global_position - global_position
	bullet.global_position = $Marker2D.global_position
	get_parent().add_child(bullet)
	
	

func kill():
	get_tree().reload_current_scene()

func _process(_delta):
	if Input.is_action_just_pressed("laser"):
		var coll = lasergun.get_collider()
		if coll.name == "Area2D":
			get_tree().change_scene_to_file("res://main_menu.tscn")	
			

func _physics_process(_delta):
	# Get the input direction and handle the movement/acceleration.
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	
	var look_vec = get_global_mouse_position() - global_position
	global_rotation = atan2(look_vec.y, look_vec.x)
	
	velocity += direction * ACC
	
	



	
#func shoot():
#	var bullet = bulletPath.instantiate()
#
#	get_parent().add_child(bullet)
#	bullet.position = $Marker2D.global_position
	
	
	move_and_slide()
