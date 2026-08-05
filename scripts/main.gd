extends Node2D
var pontos := 0
@onready var spawner_lixo: SpawnLixo = $SpawnLixo
@onready var pontos_spawn_lixo: Array[Marker2D] = []
@onready var camera_2d: Camera2D = $Caminhao/Camera2D
@onready var caminhao: CharacterBody2D = $Caminhao

@export var timeout_inicio := 3
@export var objetivo := 2

func _ready() -> void:
	ativar_caminhao(false)
	spawn_lixo()

	atualizar_pontos()
	
	await get_tree().create_timer(1.0).timeout
	var tween = create_tween()
	tween.tween_property(camera_2d, "zoom", Vector2(5, 5), timeout_inicio)
	await get_tree().create_timer(timeout_inicio).timeout
	ativar_caminhao(true)

func spawn_lixo():
	for ponto in $PontosSpawnLixo.get_children():
		pontos_spawn_lixo.append(ponto as Marker2D)
	spawner_lixo.setup(pontos_spawn_lixo)
	spawner_lixo.spawn(objetivo)

	EventHub.lixo_coletado.connect(_on_lixo_coletado)

func _on_lixo_coletado():
	pontos += 1
	atualizar_pontos()

func atualizar_pontos():
	$CanvasLayer/HUD.atualizar_pontos(pontos, objetivo)
	if (pontos == objetivo):
		$CanvasLayer/HUD/PanelGanhou.visible = true
		ativar_caminhao(false)
		return

func ativar_caminhao(ativado: bool):
	caminhao.process_mode = Node.PROCESS_MODE_INHERIT if ativado else Node.PROCESS_MODE_DISABLED
