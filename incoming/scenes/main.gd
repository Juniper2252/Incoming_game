extends Node2D
@export var healthValue = 100
var scoreValue = 0
@onready var health: TextureProgressBar = $labels/health
@onready var progress: ProgressBar = $labels/Progress
var levelup = 0
var levels: Array = [5,6,10,10,15,20,25,30,40,50,1]
var timer = [1,0.9,0.8,0.7,0.6,0.5,0.4,0.4,0.3,0.2]
@onready var comet_spawner: Node = $CometSpawner
@onready var target: Area2D = $target

func _ready() -> void:
	SignalManager.onDestroyed.connect(Destroyed)
	SignalManager.onHitEarth.connect(HitEarth)
	SignalManager.onUFO.connect(UFO)
	
func HitEarth(_body):
	healthValue -= 10
	health.value = healthValue
	if healthValue <= 0:
		$GameEndLost/score.text = "reached level " + str(levelup + 1)
		$GameEndLost/score2.text = "hit " + str(target.clicksHit) + " comets, approx. $" + str(324 * target.clicksHit) + " million"
		$GameEndLost.visible = true
		get_tree().paused = true
		return
	$FreezeManager.freezeframe()
	
func Destroyed(_body):
	scoreValue += 1
	if scoreValue == levels[levelup]:
		scoreValue = 0
		levelup += 1
		$labels/Label.text = "LVL " + str(levelup +1)
		$CometSpawner.timerLength = timer[levelup]
		$CometSpawner.speedUp = $CometSpawner.speedUp*1.1
		if levels[levelup] == 1:	
			$GameEnd.visible = true
			$GameEnd/score2.text ="hit " + str(target.clicksHit) + " comets, approx. $" + str(324 * target.clicksHit) + " million"
			get_tree().paused = true
		progress.max_value = levels[levelup]
		progress.value = scoreValue
	else:
		progress.value = scoreValue

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	


func UFO():
	for i in $Comets.get_children():
		SignalManager.onDestroyed.emit(i)
		
