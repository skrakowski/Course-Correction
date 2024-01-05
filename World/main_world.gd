extends Node

@onready var coll_ceil = $StaticBody2D/Collision_Ceil
@onready var poly_ceil = $StaticBody2D/Collision_Ceil/Polygon_Ceil
@onready var coll_floor = $StaticBody2D/Collision_Floor
@onready var poly_floor = $StaticBody2D/Collision_Floor/Polygon_Floor
@onready var pause_menu = $pauseMenu

var paused = false

#Matches polygon textures/color to the mapped areas
func _ready():
	poly_floor.polygon = coll_floor.polygon
	poly_ceil.polygon = coll_ceil.polygon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseGame()
		
func pauseGame():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused 


func _on_area_2d_body_entered(_body):
	$storeScreen/Label.show()


func _on_area_2d_body_exited(_body):
	$storeScreen/Label.hide()
