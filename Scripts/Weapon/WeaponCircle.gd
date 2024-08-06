extends Node2D



var MousePos
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	_get_rotation()



func _get_rotation():
	if global_rotation_degrees > -89:
		print("rechts",global_rotation_degrees)
		$Gun.flip_v = false
	else:
		print("links",global_rotation_degrees)
		$Gun.flip_v = true
