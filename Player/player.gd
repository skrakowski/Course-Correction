extends CharacterBody2D

const ACC = 5
const bulletPath = preload("res://Interactions/bullet.tscn")

func _unhandled_input(event):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var bullet = bulletPath.instantiate()

	get_parent().add_child(bullet)
	bullet.position = $Node2D/Marker2D.global_position
	
	
	#bullet.velocity = get_global_mouse_position() - bullet.position


func _physics_process(_delta):
	
	# Get the input direction and handle the movement/acceleration.
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	
	velocity += direction * ACC
	
	$Node2D.look_at(get_global_mouse_position())


	

