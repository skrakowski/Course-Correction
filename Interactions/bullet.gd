extends CharacterBody2D

var bVelocity = Vector2(1,0)
var bSpeed = 300
var time = 50

func _physics_process(delta):
	move_and_collide(bVelocity.normalized() * delta * bSpeed)
	time -= 1
	if time < 0:
		queue_free()


func _on_area_2d_body_entered(body):
	if body != self:
		queue_free()
