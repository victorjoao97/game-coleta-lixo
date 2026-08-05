extends Control
var dialog = AcceptDialog.new()

func _ready() -> void:
	add_child(dialog)

func _on_sair_pressed() -> void:
	get_tree().quit()

func _on_configuracoes_pressed() -> void:
	dialog.dialog_text = "🚧 Configurações em breve!"
	dialog.exclusive = true
	dialog.popup_centered()

func _on_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
