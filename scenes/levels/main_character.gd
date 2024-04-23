extends CharacterBody2D

@export var speed = 300

func _ready():
	position = position.clamp(Vector2(334, 66), Vector2(912, 600))

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	pick_animation(velocity)
	$AnimatedSprite2D.play()
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		position += velocity * delta
		position = position.clamp(Vector2(334, 66), Vector2(950, 651))

func pick_animation(vel):
	if vel.length() == 0:
		$AnimatedSprite2D.animation = "stand"
	elif vel.x != 0:
		$AnimatedSprite2D.animation = "walk_left"
		$AnimatedSprite2D.flip_h = vel.x < 0
	elif vel.y > 0:
		$AnimatedSprite2D.animation = "walk_left"
	elif vel.y < 0:
		$AnimatedSprite2D.animation = "walk_left"
