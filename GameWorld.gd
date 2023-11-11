extends Node2D

var lives = 3
var score = 0
var apple = preload("res://AppleScene.tscn")
var ice_cream = preload("res://IceCreamScene.tscn")

func _ready():
	pass 

func _on_Timer_timeout():
	randomize()
	var fruits = [apple, ice_cream]
	var random_fruit = fruits[randi()%fruits.size()]
	var random_fruit_instance = random_fruit.instance()
	
	random_fruit_instance.position = Vector2(rand_range(150, 750), -300)
	
	add_child(random_fruit_instance)

func _on_Area2D_body_entered(body):
	if body.name == "Apple":
		score += 1
		$ScoreLabel.text = "Score: " + str(score)
		$AudioCollectFruit.play()
	elif body.name == "IceCream":
		lives -= 1
		$LivesLabel.text = "Lives: " + str(lives)
		$AudioError.play()
	body.queue_free()
	
	if lives <= 0:
		_game_over()

func _game_over():
	pass
