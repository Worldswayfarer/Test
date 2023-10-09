extends RigidBody2D

@export var _min_speed = 150.0
@export var _max_speed = 250.0


func _ready():
	$AnimatedSprite2D.play()
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	
	$AnimatedSprite2D.animation = mob_types[randi_range(0, mob_types.size()-1)]


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
