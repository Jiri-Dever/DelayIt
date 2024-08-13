extends Line2D

var mousep = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	var start_pos = Vector2(0, 0)  # Start at the character's position
	var aim_direction = Vector2(1, 0).rotated(rotation) * 100  # Direction with length 100
	points = [start_pos, aim_direction]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mousep = get_local_mouse_position()
	var start_pos = Vector2(32, -2.5)  # Start at the character's position

	points = [start_pos, mousep*3]



		

