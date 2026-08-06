extends Node2D
@onready var spawner_lixo: SpawnLixo = $SpawnLixo
@onready var pontos_spawn_lixo: Array[Marker2D] = []
@onready var camera_2d: Camera2D = $Caminhao/Camera2D
@onready var caminhao: CharacterBody2D = $Caminhao

@export var timeout_inicio := 3
@export var tempo_limite := 30.0

var objetivo = 0
var pontos := 0

func _ready() -> void:
	ativar_caminhao(false)
	spawn_lixo()
	atualizar_pontos()
	
	await get_tree().create_timer(1.0).timeout
	var tween = create_tween()
	tween.tween_property(camera_2d, "zoom", Vector2(5, 5), timeout_inicio)
	EventHub.emit_iniciar_countdown(timeout_inicio)
	await get_tree().create_timer(timeout_inicio).timeout
	ativar_caminhao(true)
	
	EventHub.emit_iniciar_fase(tempo_limite)
	EventHub.connect("nova_tentativa", _on_tentar_novamente)
	EventHub.connect("jogo_finalizado", _on_finalizar_jogo)

func spawn_lixo():
	for ponto in $PontosSpawnLixo.get_children():
		pontos_spawn_lixo.append(ponto as Marker2D)
		objetivo += 1
	spawner_lixo.setup(pontos_spawn_lixo)
	spawner_lixo.spawn(objetivo)

	EventHub.lixo_coletado.connect(_on_lixo_coletado)
	EventHub.emit_atualizar_objetivo(objetivo)

func _on_lixo_coletado():
	pontos += 1
	atualizar_pontos()

func atualizar_pontos():
	print("Pontos: %d Objetivo: %d" % [pontos, objetivo])
	if (pontos == objetivo):
		EventHub.emit_concluir_fase()
		ativar_caminhao(false)

func ativar_caminhao(ativado: bool):
	caminhao.process_mode = Node.PROCESS_MODE_INHERIT if ativado else Node.PROCESS_MODE_DISABLED

func _on_tentar_novamente():
	get_tree().reload_current_scene()

func _on_finalizar_jogo():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
