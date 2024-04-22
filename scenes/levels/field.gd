extends Node2D

#func _ready():
	#pass # Replace with function body.


#func _process(delta):
	#pass

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("ENTERED:" + str(get_child(1).get_child(local_shape_index).name))
