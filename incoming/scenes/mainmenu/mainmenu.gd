extends Node2D
var time = 0
func _process(delta: float) -> void:
	time += delta
	$Label.position = lerp($Label.position,  Vector2($Label.position.x,$Label.position.y + sin(time)*0.3), 1)
	
func _on_enter_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/misc/game.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
