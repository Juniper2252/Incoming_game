extends Node
var ufo = preload("res://scenes/ufo/ufo.tscn")
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()
	$Timer.wait_time = rng.randf_range(9,15)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_timer_timeout() -> void:
	$Path2D/PathFollow2D.progress_ratio = rng.randf_range(0,1)
	var instance = ufo.instantiate()
	instance.global_position = $Path2D/PathFollow2D.global_position
	$"../UFOs".add_child(instance)
	$Timer.wait_time = rng.randf_range(9, 15)
	
