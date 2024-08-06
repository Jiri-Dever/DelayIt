extends Area2D
const SPEED = 1000
var velocity = Vector2()
var speed = 100
var mouse = Vector2()
var target_vector : Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):

	position += target_vector * speed * delta

	

	translate(velocity)


	


func destroy():
	queue_free()
	
	


func _on_area_entered(area):
	destroy()


func _on_body_entered(body):
	destroy()
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
