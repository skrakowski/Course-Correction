extends CharacterBody2D

var health = 3

func _process(delta):
	if health <= 0:
		queue_free()

func _on_area_2d_body_entered(body):
	if body != self:
		health -= 1
