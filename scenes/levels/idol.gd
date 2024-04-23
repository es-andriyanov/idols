extends CharacterBody2D

signal reached_last_row

@export var speed = 500
var dropped = false

func _ready():
	pass

func _process(delta):
	#var velocity = Vector2.ZERO
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	
	if position.y >= 640.0 and not dropped:
		dropped = true
		velocity.y = 0
		print("Baaam1...")
		reached_last_row.emit()
		#$Area2D/CollisionShape2D.set_deferred(&"disabled", true)
	


func _on_area_2d_body_entered(body):
	print(body.name)
	if body.name == "idol":
		print("Baaam2...")
		velocity = Vector2.ZERO
		reached_last_row.emit()

