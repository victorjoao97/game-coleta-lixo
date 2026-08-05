extends CharacterBody2D

@export var velocidade_max := 50.0
@export var aceleracao := 30.0
@export var desaceleracao := 100.0
@export var rotacao := 1.0 # radianos por segundo

var direcao = 0.0
var acelerando = 0.0


func _physics_process(delta):
	var motor = Input.get_axis(
		"freiar",
		"acelerar"
	)

	# virar
	if (motor != 0):
		var virar = Input.get_axis(
			"virar_esquerda",
			"virar_direita"
		)

		rotation += virar * rotacao * delta	

	var frente = Vector2.RIGHT.rotated(rotation)

	if motor != 0:
		velocity = velocity.move_toward(
			frente * motor * velocidade_max,
			aceleracao * delta
		)
	else:
		velocity = velocity.move_toward(
			Vector2.ZERO,
			desaceleracao * delta
		)

	# remove derrapagem lateral
	var velocidade_frente = frente * velocity.dot(frente)
	velocity = velocidade_frente

	move_and_slide()
