extends CanvasLayer
@onready var health_container = $HealthContainer
var hearts: Array = []

@onready var score_text: Label = $ScoreText


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hearts = health_container.get_children()
	var player = get_parent()
	
	player.OnTakeDamage.connect(_update_hearts)
	player.OnUpdateScore.connect(_update_score_text)
	
	_update_hearts(player.health)
	_update_score_text(PlayerStats.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _update_hearts(health: int):
	for i in len(hearts):
		hearts[i].visible = i < health


func _update_score_text(score: int):
	score_text.text = "Score: " + str(score)
	
	
	
	
	
	
	
	
	
	
