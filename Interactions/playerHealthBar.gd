extends ProgressBar

@onready var player = $"../../CharacterBody2D"

func _ready():
	player.healthChanged.connect(healthUpdate)
	healthUpdate()

func healthUpdate():
	value = player.currentHealth * player.maxHealth/max_value
