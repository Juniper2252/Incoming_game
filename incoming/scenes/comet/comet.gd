extends CharacterBody2D
var rng = RandomNumberGenerator.new()
var speed: float
var cow = preload("res://assets/Untitled(1).png")
@onready var particles = $explosion
var isDestroying = false

var speedup = 1
var control = 1

func _ready():
	speed = rng.randf_range(10000,30000)*speedup*control
	SignalManager.onDestroyed.connect(Destroyed)
	$trail.direction = -global_position.direction_to(Vector2(0,0))
	var sprite = rng.randi_range(0,1)
	if sprite == 1:
		$AnimatedSprite2D.play("new_animation")
		particles = $explosion3
		
	else:
		$AnimatedSprite2D.play("rock")
	
func _process(delta):
	velocity = -global_position.normalized() * speed * delta
	move_and_slide()
	


func Destroyed(body):
	if self == body:
		if isDestroying == false:
			isDestroying = true
			$AnimatedSprite2D.queue_free()
			$CollisionShape2D.queue_free()
			$explosion2.play("default")
			$trail.emitting = false
			particles.emitting = true
		
		


func _on_explosion_finished() -> void:
	queue_free()


func _on_explosion_3_finished() -> void:
	queue_free()
