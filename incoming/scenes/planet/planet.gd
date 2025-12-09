extends Area2D
var time = 0

func _ready():
	SignalManager.onHitEarth.connect(onHit)

func _process(delta):
	time += delta*4
	var sinValue = Vector2(sin(time),sin(time)) * 0.3
	self.scale = Vector2(4,4) + sinValue
	if get_tree().paused == false:
		$AnimatedSprite2D.play("default")

func _on_body_entered(body):
	body.queue_free()
	SignalManager.onHitEarth.emit(body)

func onHit(_body):
	$AnimatedSprite2D.play("white")
	
	
