extends CharacterBody2D

const ACC = 5

func _physics_process(_delta):

	# Get the input direction and handle the movement/acceleration.
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	
	velocity += direction * ACC
	
#	print(velocity)
	
	move_and_slide()
