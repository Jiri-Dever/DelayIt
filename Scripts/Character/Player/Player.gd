extends CharacterBody2D



@onready var bullet_spawn  = $GunCircle/Gun/Muzzel2
@onready var muzzle_load : PackedScene = preload("res://Scenes/Weapon/Gun.tscn")
@onready var bullet_load : PackedScene = preload("res://Scenes/Weapon/Bullet/Bullet.tscn")
var mousePos = Vector2()
@onready var pistol_bullet_marker = $GunniSprite/Muzzel/Marker2D



@export var move_speed = 400.0





	# Vars for Jumpings
@export var jump_height : float
@export var jump_time_to_peak : float
@export var jump_time_to_descent : float

@export var max_jumps : int
@export var double_jump_strength = 1200



var jump_velocity : float
var jump_gravity : float 
var fall_gravity : float 

var accel = 200
##


# Vars for horizontal
@export var max_speed = 900
@export var friction : float
@export var ground_accel : float
@export var speed : float

var horizontal_velocity : float


func _ready():
	# Vars for Jumpings
	jump_velocity = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
	jump_gravity = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
	fall_gravity = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0


	# for ground accel
	horizontal_velocity = ((2.0 * speed) / jump_time_to_peak) * -1.0
	


func get_gravity():

	if velocity.y < 0.0:
		
		return jump_gravity
	else:
		
		return fall_gravity
 

func jump():
	
	if max_jumps > 0:
		velocity.y = jump_velocity
		max_jumps -= 1

	else:
		pass#play sound or shake screen etc	

	
func jump_effect():
	pass
	
func get_input_vel():


	var horizontal = 0.0
	if Input.get_action_raw_strength("move_left"):
		
		horizontal -= 1.0
		
	if Input.get_action_raw_strength("move_right"):
		horizontal += 1.0
		
		
	return horizontal

#Not doing anything
func get_player_dir():
	var player_dire
	if player_dire > 0:
		print("rechts")
	else:
		print("links")


func _physics_process(delta):

	if is_on_floor():
		if max_jumps != 2:
			max_jumps = 2
	else:
		velocity.y += get_gravity() * delta
	velocity.x = get_input_vel() * move_speed
	if Input.is_action_just_pressed("move_jump"):
		jump()

	if Input.is_action_pressed("mouse_aim"):
		$Line2D.drawline()
		
	if Input.is_action_just_pressed("mouse_shoot"):
		shoot()
#DEBUG FOR LABEL vel
	$Vel.text = str("vel.y: "+str(velocity.y)+"\n"+"vel.x"+str(velocity.x))



	move_and_slide()



var can_shoot = true
var delay = 0.5


func shoot():

	
	if can_shoot:
		can_shoot = false
		var mouse_position: Vector2 = (get_global_mouse_position() - global_position).normalized()
		
		var bullet = bullet_load.instantiate()
		bullet.position = bullet_spawn.global_position
		bullet.rotation = bullet_spawn.global_rotation
		get_parent().add_child(bullet)
		await get_tree().create_timer(delay).timeout
		can_shoot = true
		
			# Add the bullet to the scene tree
	else:
		pass
		#Play Click Sound or smth

