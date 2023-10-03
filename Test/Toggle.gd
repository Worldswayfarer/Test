extends Node2D

signal toggleGodot()

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		toggleGodot.emit()
