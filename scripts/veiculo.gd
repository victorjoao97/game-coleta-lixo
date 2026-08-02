extends CharacterBody2D

@export var aceleracao := 500.0/2
@export var frenagem := 800.0/2
@export var velocidade_max := 600.0/10
@export var velocidade_re := 200.0/2
@export var rotacao := 3.0 # radianos por segundo

var velocidade := 0.0


func _physics_process(delta):

	# acelera / ré
	var input_acelerar = Input.get_axis("freiar", "acelerar")

	if input_acelerar > 0:
		velocidade = move_toward(
			velocidade,
			velocidade_max,
			aceleracao * delta
		)

	elif input_acelerar < 0:
		velocidade = move_toward(
			velocidade,
			-velocidade_re,
			frenagem * delta
		)

	else:
		# soltar acelerador
		velocidade = move_toward(
			velocidade,
			0,
			frenagem * delta
		)


	# direção
	var direcao = Input.get_axis("virar_esquerda", "virar_direita")

	if abs(velocidade) > 10:
		rotation += direcao * rotacao * delta * sign(velocidade)


	# movimento na direção que o carro aponta
	velocity = Vector2.RIGHT.rotated(rotation) * velocidade

	move_and_slide()
	
	print(rotation_degrees)
