extends Node2D
class_name SpawnLixo

@export var cena_lixo: PackedScene

var spawn_pontos: Array[Marker2D] = []

func setup(pontos: Array[Marker2D]):
	spawn_pontos = pontos

func spawn(quantidade):
	for i in range(quantidade):
		var ponto = spawn_pontos.pick_random()

		var lixo = cena_lixo.instantiate()
		lixo.position = ponto.global_position
		get_parent().add_child(lixo)
