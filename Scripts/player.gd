extends CharacterBody3D
signal OnTakeDamage(hp: int)
signal OnUpdateScore(score: int)

@export var health : int = 5
@export var move_speed : float = 3.0
@export var jump_force : float = 8.0
@export var gravity : float = 20.0

@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
@onready var camera : Camera3D = $Camera3D

var coin_sfx : AudioStream = preload("res://Audio/coin.wav")
var take_damage_sfx : AudioStream = preload("res://Audio/take_damage.wav")

func _physics_process(delta: float) -> void:
	if global_position.y < -5:
		_game_over()
	# Apply gravity
	velocity.y -= gravity * delta
	
	# Implement jumping
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	
	# Implement movement
	var move_input : Vector2 = -Input.get_vector("move_right", "move_left", "more_back", "more_forward")
	var move_dir : Vector3 = Vector3(move_input.x, 0, move_input.y)
	velocity.x = move_dir.x * move_speed
	velocity.z = move_dir.z * move_speed
	
	
	move_and_slide()
	
func take_damage(amount: int):
	health -= amount
	OnTakeDamage.emit(health)
	if health <= 0:
		_game_over()
		
func _game_over():
	PlayerStats.score = 0
	get_tree().reload_current_scene()
	#get_tree().change_scene_to_file("res://Scenes/Level_1.tscn")
	
func increase_score(amount: int):
	PlayerStats.score += amount
	OnUpdateScore.emit(PlayerStats.score)
	_play_sound(coin_sfx)
	
func _play_sound(sound: AudioStream):
	audio.stream = sound
	audio.play()
	
	
	
	
	
