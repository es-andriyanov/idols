extends ParallaxBackground

signal music_vol_changed(new_vol)

@export var speed = 300
@export var is_intro_finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$ParallaxLayer2_Settings.hide()


#func _process(delta):
	#var velocity = Vector2.ZERO
	#
	#if is_intro_finished:
		##$ParallaxLayer1.position = get_viewport().get_mouse_position() * delta 
		##$ParallaxLayer2.position = get_viewport().get_mouse_position() * 2 * delta
		##$ParallaxLayer3.position = get_viewport().get_mouse_position() * 3 * delta
		##$ParallaxLayer4.position = get_viewport().get_mouse_position() * 4 * delta
		#
		#if Input.is_action_pressed("move_right"):
			#velocity.x += 1
		#if Input.is_action_pressed("move_left"):
			#velocity.x -= 1
		#if Input.is_action_pressed("move_down"):
			#velocity.y += 1
		#if Input.is_action_pressed("move_up"):
			#velocity.y -= 1
	#
	#if velocity.length() > 0:
		#velocity = velocity.normalized () * speed
		#
		


func _on_settings_pressed():
	$ParallaxLayer2_Settings.show()
	$ParallaxLayer2_Main.hide()


func _on_back_pressed():
	$ParallaxLayer2_Main.show()
	$ParallaxLayer2_Settings.hide()


func _on_music_vol_value_changed(value):
	music_vol_changed.emit($ParallaxLayer2_Settings/MusicVol.value)
