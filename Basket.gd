extends KinematicBody2D

var velocity = Vector2(0, 0)
var score = 0

func _ready():
	pass

func _physics_process(_delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -300
	elif Input.is_action_pressed("ui_right"):
		velocity.x = 300
	
	move_and_slide(velocity)
	velocity.x = lerp(velocity.x, 0, 0.1)
