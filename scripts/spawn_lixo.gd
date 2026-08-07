extends Node2D
class_name SpawnLixo

@export var cena_lixo: PackedScene

var spawn_pontos: Array[Marker2D] = []

func setup(pontos: Array[Marker2D]):
	spawn_pontos = pontos
	for i in spawn_pontos:
		var ponto = encontra_ponto_disponivel()
		var lixo = cena_lixo.instantiate()
		lixo.position = ponto.global_position
		get_parent().add_child(lixo)

func encontra_ponto_disponivel() -> Marker2D:
	var ponto = spawn_pontos.pick_random()
	var ponto_index = spawn_pontos.find(ponto)
	spawn_pontos.pop_at(ponto_index)
	return ponto
