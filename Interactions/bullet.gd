extends CharacterBody2D

var bVelocity = Vector2(1,0)
var bSpeed = 300

func _physics_process(delta):
	
	move_and_collide(bVelocity.normalized() * delta * bSpeed)


