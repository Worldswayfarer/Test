extends Node

@export var _mob_scene: PackedScene
var _score = 0



func _ready():
	randomize()


func new_game():
	_score = 0
	$HUD.update_score(_score)
	
	get_tree().call_group("Mobs", "queue_free")
	
	$ScoreTimer.start()
	$MobTimer.start()


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()


func _on_mob_timer_timeout():
	var mob_spawn_loacation = $MobPath/MobSpawnLoacation
	mob_spawn_loacation.progress_ratio = randf_range(0, 100)
	
	var mob = _mob_scene.instantiate()
	add_child(mob)
	
	mob.position = mob_spawn_loacation.position
	
	var direction = mob_spawn_loacation.rotation + PI / 2
	direction += randf_range(-PI/4, PI/4)
	mob.rotation = direction
	
	var velocity = Vector2(randi_range(mob._min_speed, mob._max_speed), 0)
	mob.linear_velocity = velocity.rotated(direction)


func _on_score_timer_timeout():
	_score += 1
	$HUD.update_score(_score)
