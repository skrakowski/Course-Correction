extends CharacterBody2D

const ACC = 5
const bulletPath = preload("res://Interactions/bullet.tscn")


func shoot():
	var bullet = bulletPath.instantiate()

	get_parent().add_child(bullet)
	bullet.position = $Marker2D.global_position

func _physics_process(_delta):

	# Get the input direction and handle the movement/acceleration.
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	
	velocity += direction * ACC
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	move_and_slide()
