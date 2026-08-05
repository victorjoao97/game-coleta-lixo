extends Area2D
class_name Lixo

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("caminhao"):
		EventHub.emit_lixo_coletado()
		queue_free()
