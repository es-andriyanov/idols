extends ParallaxBackground

signal music_vol_changed(new_vol)
signal level_picked(level)

@export var speed = 300
@export var is_intro_finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$ParallaxLayer2_Settings.hide()
	$ParallaxLayer2_Main/WelcomeWindow.hide()
	$ParallaxLayer2_Main/ShutDownBg.hide()

func _process(delta):
	pass
		
func deactivate_icons():
	pass


func _on_ok_pressed():
	$ParallaxLayer2_Main/WelcomeWindow.hide()


func _on_start_pressed():
	$ParallaxLayer2_Start.show()
	$ParallaxLayer2_Main.hide()
	

func _on_settings_pressed():
	$ParallaxLayer2_Settings.show()
	$ParallaxLayer2_Main.hide()


func _on_back_pressed():
	$ParallaxLayer2_Main.show()
	$ParallaxLayer2_Settings.hide()
	$ParallaxLayer2_Start.hide()


func _on_quit_pressed():
	$TimerWelcome.stop()
	$ParallaxLayer2_Main/WelcomeWindow.hide()
	
	$ParallaxLayer2_Main/ShutDownBg.show()
	$ParallaxLayer2_Main/AnimationPlayer.play("shut_down")
	await get_tree().create_timer(2.0).timeout
	get_tree().quit()


func _on_music_vol_value_changed(value):
	music_vol_changed.emit($ParallaxLayer2_Settings/MusicVol.value)


func _on_timer_welcome_timeout():
	$ParallaxLayer2_Main/WelcomeWindow.show()


func _on_level_1_pressed():
	$ParallaxLayer2_Main.show()
	$ParallaxLayer2_Settings.hide()
	$ParallaxLayer2_Start.hide()
	level_picked.emit(1)


func _on_level_2_pressed():
	$ParallaxLayer2_Main.show()
	$ParallaxLayer2_Settings.hide()
	$ParallaxLayer2_Start.hide()
	level_picked.emit(2)


func _on_level_3_pressed():
	$ParallaxLayer2_Main.show()
	$ParallaxLayer2_Settings.hide()
	$ParallaxLayer2_Start.hide()
	level_picked.emit(3)
	

func _on_level_4_pressed():
	$ParallaxLayer2_Main.show()
	$ParallaxLayer2_Settings.hide()
	$ParallaxLayer2_Start.hide()
	level_picked.emit(4)
