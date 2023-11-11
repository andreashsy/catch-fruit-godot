extends Node2D

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
	score += 1
	get_node("ScoreLabel").text = "Score: " + str(score)
	get_node("AudioCollectFruit").play()
	body.queue_free()
