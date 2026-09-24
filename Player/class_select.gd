extends Control
var classe_escolhendo
@onready var guerreiro: Button = $guerreiro
@onready var arqueiro: Button = $arqueiro
@onready var mago: Button = $mago
@onready var info: Label = $Info



func _on_button_pressed() -> void:
	classe_escolhendo = Classes.guerreiro()
	info.text = "Classe: " + str(Classes.guerreiro().display_name) + "\nvida: " + str(Classes.guerreiro().max_health) + "\nmana: " + str(Classes.guerreiro().max_mana) + "\nforça: " + str(Classes.guerreiro().strength) +"\nvelocidade: " + str(Classes.guerreiro().speed);

func _on_arqueiro_pressed() -> void:
	classe_escolhendo = Classes.arqueiro()
	info.text = "Classe: " + str(Classes.arqueiro().display_name) + "\nvida: " + str(Classes.arqueiro().max_health) + "\nmana: " + str(Classes.arqueiro().max_mana) + "\nforça: " + str(Classes.arqueiro().strength) +"\nvelocidade: " + str(Classes.arqueiro().speed);

func _on_select_pressed() -> void:
	if classe_escolhendo == null: 
		return
	Classes.selected_class = classe_escolhendo
	get_tree().change_scene_to_file("res://Mundo/mundo_teste.tscn")

func _on_mago_pressed() -> void:
	classe_escolhendo = Classes.mago()
	info.text = "Classe: " + str(Classes.mago().display_name) + "\nvida: " + str(Classes.mago().max_health) + "\nmana: " + str(Classes.mago().max_mana) + "\nforça: " + str(Classes.mago().strength) +"\nvelocidade: " + str(Classes.arqueiro().speed);
