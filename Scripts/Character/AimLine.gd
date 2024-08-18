extends Line2D

@onready var RaycastAimLine = $RaycastAimLine



var mousep = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var aim_direction = Vector2(1, 0).rotated(rotation) * 100  # Direction with length 100
	

	mousep = get_local_mouse_position()
	var start_pos = Vector2(32, -2.5)  # Start at the character's position
	
	var bounds
	var collider
	
	# While this is not necessarily needed, it is probably a good idea to force
		# the raycast to update before checking if it has collided.
	# (you may only need this If ray_projectile.enabled is false)
	RaycastAimLine.force_raycast_update()
	if RaycastAimLine.is_colliding():
		collider = RaycastAimLine.get_collider()
		var point = RaycastAimLine.get_collision_point()
	# Set the position of the particles to the position of the raycast collision

		
		
		print(collider)
		
		
		var a =to_local(point)
		points = [start_pos, a]
	else:
		points = [start_pos, start_pos+Vector2(600,0)]
		
		
		
		
		
		
		
		
