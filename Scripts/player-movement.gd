"""
Hola pato como estas papu. Oye we, este comentario te lo hago a ti especificamente
porque alchile despues de hacerle ingenieria inversa a tu juego (si, es una frase innecesariamente
larga para sonar mas aca), me di cuenta que no tenias ni un comentario en tu codigo.

Espero que aprendas a hacer comentarios, como diria hornet, git gud.
"""
extends Node2D

@onready var DASH_TIMER := $DashTimer

@export var SPEED := 500
@export var DASH_SPEED := 1500
@export var DASH_DURATION := 0.2
@export var DASH_COOLDOWN := 1.0

var can_dash = true
var invulnerability := false
var speed_now := SPEED
var time_passed := 0.0

# Function for dashing
func dash():
	can_dash = false
	invulnerability = true
	speed_now = DASH_SPEED
	time_passed = 0.0

	while time_passed < DASH_DURATION:
		await get_tree().create_timer(0.01).timeout
		time_passed += 0.01
		speed_now = lerp(DASH_SPEED, SPEED, time_passed / DASH_DURATION)

	# End of dash
	invulnerability = false
	speed_now = SPEED
	DASH_TIMER.start()
	

func try_dash():
	print("tried dash")
	if can_dash == true:
		print("can dash")
		dash()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta: float):
	# Player movement
	var direction = Input.get_vector("left", "right", "up", "down");
	position += direction * speed_now * delta

	# Dash trigger
	if Input.is_action_just_pressed("dash"):
		try_dash()


func _on_dash_timer_timeout() -> void:
	can_dash = true;
