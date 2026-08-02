extends OverheadCarBody2D

@onready var sprite = $AnimatedSprite2D

var velocidade := 0.0	

func _provide_input(input: CarInput):
	input.steering = Input.get_axis("virar_esquerda", "virar_direita")
	input.acceleration = Input.get_axis("freiar", "acelerar")
	#if Input.is_action_pressed("acelerar"):
		#input.acceleration = 1.0
	#if Input.is_action_pressed("freiar"):
		#input.acceleration = -1.0
	#if Input.is_action_pressed("virar_esquerda"):
		#input.steering = -1.0
	#if Input.is_action_pressed("steer_right"):
		#input.steering = 1.0
	#input.braking = Input.is_action_pressed("brake")

#func _physics_processs(delta):
#
	## acelera / ré
	#var input_acelerar = Input.get_axis("freiar", "acelerar")
#
	#if input_acelerar > 0:
		#velocidade = move_toward(
			#velocidade,
			#velocidade_max,
			#aceleracao * delta
		#)
#
	#elif input_acelerar < 0:
		#velocidade = move_toward(
			#velocidade,
			#-velocidade_re,
			#frenagem * delta
		#)
#
	#else:
		## soltar acelerador
		#velocidade = move_toward(
			#velocidade,
			#0,
			#frenagem * delta
		#)
#
#
	## direção
	#var direcao = Input.get_axis("virar_esquerda", "virar_direita")
#
	#if abs(velocidade) > 10:
		#rotation += direcao * rotacao * delta * sign(velocidade)
#
#
	## movimento na direção que o carro aponta
	#velocity = Vector2.RIGHT.rotated(rotation) * velocidade
#
	#move_and_slide()	
	#
	#if (velocidade > 0):
		#sprite.animation = "movendo-leste"
	#if (velocidade == 0):
		#sprite.animation = "parado"
		#var angulo_normalizado = fmod(rotation_degrees + 360, 360)
		#var frame_index = int(angulo_normalizado / (360.0 / 48.0))
		#sprite.frame = frame_index
	#
	#print(rotation_degrees)
