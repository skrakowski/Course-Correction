extends CharacterBody2D

const ACC = 5
const bulletPath = preload("res://Interactions/bullet.tscn")

@onready var lasergun = $RayCast2D
@export var fire_type = 1

func _unhandled_input(event):
	if Input.is_action_just_pressed("shoot"):
		shoot()

#Creates the Triblast bullets
func shoot():
	if fire_type == 1:
		var bullet = bulletPath.instantiate()
		bullet.bVelocity = $Marker2D.global_position - global_position
		bullet.global_position = $Marker2D.global_position
		get_parent().add_child(bullet)
	if fire_type == 2:
		var bullet = bulletPath.instantiate()
		bullet.bVelocity = $Marker2D.global_position - global_position
		bullet.global_position = $Marker2D.global_position
		get_parent().add_child(bullet)
	
		var bullet2 = bulletPath.instantiate()
		bullet2.bVelocity = $Marker2D2.global_position - global_position
		bullet2.global_position = $Marker2D2.global_position
		get_parent().add_child(bullet2)

		var bullet3 = bulletPath.instantiate()
		bullet3.bVelocity = $Marker2D3.global_position - global_position
		bullet3.global_position = $Marker2D3.global_position
		get_parent().add_child(bullet3)
	if fire_type == 3:
		if lasergun.is_colliding():
			var target = lasergun.get_collider()
			if target.is_in_group("enemy"):
				target.health -= 1



	

func kill():
	get_tree().reload_current_scene()

#Laser Gun Functionality

				
			

func _physics_process(_delta):
	# Get the input direction and handle the movement/acceleration.
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	#Character follows mouse direction
	var look_vec = get_global_mouse_position() - global_position
	global_rotation = atan2(look_vec.y, look_vec.x)
	
	velocity += direction * ACC
	
	



	
#func shoot():
#	var bullet = bulletPath.instantiate()
#
#	get_parent().add_child(bullet)
#	bullet.position = $Marker2D.global_position
	
	
	move_and_slide()
