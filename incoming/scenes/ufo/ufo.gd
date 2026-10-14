extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.onUFO.connect(UFO)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity.x = 40000 * delta
	if position.x > 820:
		print("Destroyed")
		queue_free()
	move_and_slide()
		

func UFO():
	$AnimatedSprite2D.queue_free()
	$CollisionShape2D.queue_free()
	$explosion.emitting = true
	


func _on_explosion_finished() -> void:
	queue_free()
