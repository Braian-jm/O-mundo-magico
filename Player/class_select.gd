extends Control
var classe_escolhendo
@onready var guerreiro: Button = $guerreiro
@onready var arqueiro: Button = $arqueiro
@onready var mago: Button = $mago



func _on_button_pressed(bt) -> void:
	classe_escolhendo = Classes.guerreiro()

func _on_arqueiro_pressed() -> void:
	classe_escolhendo = Classes.arqueiro()

func _on_select_pressed() -> void:
	Classes.selected_class = classe_escolhendo
	get_tree().change_scene_to_file("res://Mundo/mundo_teste.tscn")



func _on_mago_pressed() -> void:
	classe_escolhendo = Classes.mago()
