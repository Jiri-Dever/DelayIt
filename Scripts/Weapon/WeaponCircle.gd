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
	if global_rotation_degrees < 90 and global_rotation_degrees > -90:
		$"../DebugLabel".text = ("rechts")
		$Gun.flip_v = false
	else:
		$"../DebugLabel".text = ("links")
		$Gun.flip_v = true
