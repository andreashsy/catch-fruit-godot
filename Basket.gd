extends KinematicBody2D

var velocity = Vector2(0, 0)
var score = 0
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -300
	elif Input.is_action_pressed("ui_right"):
		velocity.x = 300
	
	velocity.x = lerp(velocity.x, 0, 0.1)
	position += velocity * delta
	
	position.x = clamp(position.x, 0, screen_size.x)
