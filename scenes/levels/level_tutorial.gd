extends Node

signal dialog_done

@export var idol_scene: PackedScene
var arr: Array
var idol
var game_started = false
var cur_pos = 0
@onready var nodes = get_tree().get_nodes_in_group("spawn")
var scene_menu = preload("res://scenes/menu/menu.tscn")
var node


func _ready():
	$MainCharacter.hide()
	$dialoguebox2.hide()
	$Timer.start()
	$Frame.set_self_modulate(Color(1, 1, 1, 0))
	$Field/Sprite2D.set_self_modulate(Color(1, 1, 1, 0))
	play_shut_up()
	
	await get_tree().create_timer(2.0).timeout
	#dialog_done.emit()


func _process(delta):
	pass


func play_shut_up():
	$LevelIntro/BlackBg.set_color(Color(0, 0, 0, 1.0)) #to black
	$LevelIntro/BlackBg.show()
	$LevelIntro/AnimationPlayer.play("shut_up")
	await get_tree().create_timer(2.0).timeout
	
func play_shut_down():
	$LevelIntro/BlackBg.set_color(Color(0, 0, 0, 0.0)) #to black
	$LevelIntro/BlackBg.show()
	$LevelIntro/AnimationPlayer.play("shut_up")
	await get_tree().create_timer(2.0).timeout


func _on_dialog_done():
	$LevelIntro.queue_free()
	$Field/AnimationPlayer.play("show_up")
	await get_tree().create_timer(0.5).timeout
	$MainCharacter.show()
	$Frame/AnimationPlayer.play("show_up")
	game_started = true
	$IdolCreateTimer.start()
	$IdolCreateTimer.set_paused(false)


func _on_idol_create_timer_timeout():
	print("Idol creation...")
	$Field/Area2D.monitoring = true
	idol = idol_scene.instantiate()
	idol.show()
	idol.position = nodes[cur_pos % 7].position
	add_child(idol)
	arr.append(idol)
	
	idol.reached_last_row.connect(_on_reached_last_row)
	
	#$IdolCreateTimer.stop()
	$IdolCreateTimer.set_paused(true)
	$IdolShootTimer.start()


func _on_field_new_idol_pos(curr):
	cur_pos = curr
	
	if idol:
		idol.position = nodes[cur_pos % 7].position


func _on_idol_shoot_timer_timeout():
	print("Shoot.....")
	$Field/Area2D.monitoring = false
	idol.velocity.y += 1
	$IdolShootTimer.stop()

func _on_reached_last_row():
	#print("TYTATATAWTAWTAWT")
	$IdolCreateTimer.set_paused(false)


func _on_dialoguebox_fight():
	dialog_done.emit()


func _on_dialoguebox_2_end_fight():
	for i in arr.size():
		arr[i].queue_free()
	
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_packed(scene_menu)


func _on_timer_timeout():
	$IdolCreateTimer.set_paused(true)
	$IdolShootTimer.set_paused(true)
	$dialoguebox2.show()
	$MainCharacter.hide()
	
