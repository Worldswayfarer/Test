extends CanvasLayer

signal _start_game


func update_score(score):
	$Score.text = str(score)


func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()


func show_game_over():
	show_message("GAME OVER")
	await($MessageTimer.timeout)
	$MessageLabel.text = "Dodge the Creeps"
	$MessageLabel.show()
	await get_tree().create_timer(1.0).timeout
	$Button.show()


func _on_button_pressed():
	$Button.hide()
	_start_game.emit()


func _on_message_timer_timeout():
	$MessageLabel.hide()
