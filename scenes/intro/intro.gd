extends Node2D

signal end_intro

#var next_scene = preload("res://menu.tscn")

func _ready():
	$AnimationPlayer.play("come_in")

func _on_animation_player_animation_finished(ani_name):
	if ani_name == "come_in":
		$AnimationPlayer.play("come_out")
		
	if ani_name == "come_out":
		queue_free()
		end_intro.emit()
