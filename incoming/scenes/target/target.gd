extends Area2D

var clicksHit = 0
func _process(_delta):
	global_position = get_global_mouse_position()
	
	if Input.is_action_just_pressed("shoot"):
		$AnimatedSprite2D.play("shoot")
		if get_overlapping_bodies():
			clicksHit += 1
			for i in get_overlapping_bodies():
				if i.get_parent() == $"../Comets":
					print("comet")
					SignalManager.onDestroyed.emit(i)
				elif i.get_parent() == $"../UFOs":
					print("UFO")
					SignalManager.onUFO.emit()
				
				
	elif Input.is_action_just_released("shoot"):
		$AnimatedSprite2D.play("default")
		
