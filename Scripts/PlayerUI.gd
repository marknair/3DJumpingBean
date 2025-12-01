extends CanvasLayer
@onready var health_container = $HealthContainer
var hearts: Array = []

@onready var score_text: Label = $ScoreText


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = get_parent()
	
	player.OnTakeDamage.connect(_update_hearts)
	player.OnUpdateScore.connect(_update_score_text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _update_hearts(health: int):
	pass
	
func _update_score_text(score: int):
	score_text.text = "Score: " + str(score)
	
	
	
	
	
	
	
	
	
	
