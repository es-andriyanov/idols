extends Node

@export var speed = 300
#var scene_1 = preload("res://scenes/levels/level_tutorial.tscn")
#var scene_2 = preload("res://scenes/levels/level_two.tscn")
var scene

# Called when the node enters the scene tree for the first time.
func _ready():
	ResourceLoader.load_threaded_request("res://scenes/levels/level_tutorial.tscn")
	ResourceLoader.load_threaded_request("res://scenes/levels/level_two.tscn")
	
	$BGComputer.hide()
	$BlackBG.hide()
	$Music.play()
	
func _process(delta):
	$Camera2D.position = Vector2(576, 324) + get_viewport().get_mouse_position() * 0.05

func _on_intro_end_intro():
	$BGComputer.is_intro_finished = true
	$BGComputer.show()

func _on_bg_computer_music_vol_changed(new_vol):
	if new_vol > 0:
		if $Music.get_stream_paused():
			$Music.set_stream_paused(false)
		$Music.set_volume_db(new_vol - 30)
	else:
		$Music.set_stream_paused(true)


func _on_bg_computer_level_picked(level):
	print(str(level) + "picked") # shut_down animation and level start
	$BlackBG.show()
	$AnimLevelPicked.play("level_picked")
	
	
	match level:
		1: 	
			scene = ResourceLoader.load_threaded_get("res://scenes/levels/level_tutorial.tscn")
			#get_tree().change_scene_to_packed(scene)
		2: 	
			scene = ResourceLoader.load_threaded_get("res://scenes/levels/level_two.tscn")
			#get_tree().change_scene_to_packed(scene)
	
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_packed(scene)
	
