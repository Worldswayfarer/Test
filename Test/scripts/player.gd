extends Area2D


signal hit 

@export var _speed: float = 400.0
var _screen_size = Vector2.ZERO


func _ready():
	_screen_size = get_viewport_rect().size
	hide()


func _start(new_position):
	position = new_position
	show()
	$CollisionShape2D.disabled = false


func _process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		$AnimatedSprite2D.animation = "right"
		$AnimatedSprite2D.flip_h = true
	if Input.is_action_pressed("move_right"):
		direction.x += 1
		$AnimatedSprite2D.animation = "right"
		$AnimatedSprite2D.flip_h = false
	
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = false
	if Input.is_action_pressed("move_down"):
		direction.y += 1
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = true
	
	if direction.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	direction.normalized()
	
	position += direction * _speed * delta
	position.x = clamp(position.x, 0, _screen_size.x)
	position.y = clamp(position.y, 0, _screen_size.y)


func _on_body_entered(body):
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	hit.emit()
