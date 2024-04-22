extends Control

@export var who_made: Array[String]
@onready var cur: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if who_made.size() > 0:
		$Label.set_text(who_made[cur])
	$Timer.start()


func _on_timer_timeout():
	cur += 1
	
	if cur >= who_made.size():
		cur = 0
	
	if who_made.size():
		$Label.set_text(who_made[cur])
