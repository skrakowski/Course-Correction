extends CharacterBody2D

var bVelocity = Vector2.RIGHT
var bSpeed = 15
var time = 50


func _on_area_2d_body_entered(body):
	if body != self:
		queue_free()

func _process(delta):
	translate(bVelocity * bSpeed * delta)
