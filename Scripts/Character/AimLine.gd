extends Line2D

var mousep = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	mousep = get_global_mouse_position() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mousep = get_local_mouse_position()
	
	
		
func drawline():
	#$"../GunCircle/Gunni/muzzel".draw_line(Vector2.ZERO, Vector2.ZERO* 300,Color.RED,0,8a)
	pass
	

