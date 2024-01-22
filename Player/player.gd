extends CharacterBody2D


const bulletPath = preload("res://Interactions/bullet.tscn")

signal healthChanged

@onready var animationPlayer = $Sprite2D
@onready var currentHealth = 100
@onready var maxHealth = 100
@onready var ACC = 5
@onready var lasergun = $RayCast2D
@onready var healthBar = $"../CanvasLayer/ProgressBar"
@export var chassis = 1
@export var fire_type = 1

func _unhandled_input(_event):
	if Input.is_action_just_pressed("shoot"):
		shoot()

#Creates Weapon Variants
func shoot():
	#Auto Cannon
	if fire_type == 1:
		var bullet = bulletPath.instantiate()
		bullet.bVelocity = $Marker2D.global_position - global_position
		bullet.global_position = $Marker2D.global_position
		get_parent().add_child(bullet)
	#Triblaster
	elif fire_type == 2:
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
	#Laser
	elif fire_type == 3:
		if lasergun.is_colliding():
			var target = lasergun.get_collider()
			if target.is_in_group("enemy"):
				target.health -= 1

#Creates Chassis Variants
func chassis_mode():
	#light chassis
	if chassis == 2:
		ACC = 8
		maxHealth = 50
		healthBar.max_value = 50
		healthBar.value = 50
		healthBar.size.x = 100
		healthChanged.emit()
	#heavy chassis
	elif chassis == 3:
		ACC = 2
		maxHealth = 150
		healthBar.max_value = 150
		healthBar.value = 150
		healthBar.size.x = 180
		currentHealth = 150
		healthChanged.emit()
	else:
		ACC = 5
		maxHealth = 100
	

func kill():
	get_tree().reload_current_scene()

#Button control for chassis mode and fire select
func _on_light_c_pressed():
	chassis = 2
	chassis_mode()
	$ColorRect.color = Color(1,0,0,1)
func _on_heavy_c_pressed():
	chassis = 3
	chassis_mode()
	$ColorRect.color = Color(0.184314,0.309804,0.309804,1)
func _on_auto_cannon_pressed():
	fire_type = 1
func _on_tri_blast_pressed():
	fire_type = 2

func _process(_delta):
	if Input.is_action_just_pressed("ui_right"):
			animationPlayer.play("move")

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
	
	
	
	move_and_slide()
	

