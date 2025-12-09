extends Node
var rng = RandomNumberGenerator.new()
var timerLength = 1
var comet = preload("res://scenes/comet/comet.tscn")
var speedUp = 1

func _on_timer_timeout():
	var pos = rng.randf_range(0,1)
	$Path2D/PathFollow2D.progress_ratio = pos	
	var instance = comet.instantiate()
	
	instance.global_position = $Path2D/PathFollow2D.global_position
	if instance.global_position.y < -530:
		instance.control = 0.6
	else:
		instance.control = 1
	$"../Comets".add_child(instance)
	instance.speedup = speedUp
	$Timer.wait_time = randf_range(1.5,3) * timerLength
	
