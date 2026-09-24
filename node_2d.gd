extends Node2D

var player_inside := false

@onready var interaction_label = $InteractionLabel
@onready var shop_menu = $CanvasLayer/ShopMenu

func _ready():
	shop_menu.visible = false
	interaction_label.visible = false

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		player_inside = true
		interaction_label.visible = true

func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		player_inside = false
		interaction_label.visible = false
		shop_menu.visible = false

func _process(_delta):
	if player_inside and Input.is_action_just_pressed("interact"):
		abrir_loja()

func abrir_loja():
	shop_menu.visible = true
	interaction_label.visible = false

func _on_buy_mana_pt_pressed() -> void:
	if Inventario.moedas - 10 >= 0: 
		Inventario.adicionar_item({
			"nome": "mana_pot",
			"quantidade": 1,
			"textura": preload("res://icon.svg"),
			"efeito": "restaurar",
			"forca": 30
		})
		Inventario.moedas -= 10
func _on_buy_str_pt_pressed() -> void:
	if Inventario.moedas - 20 >= 0: 
		Inventario.adicionar_item({
			"nome": "str_pot",
			"quantidade": 1,
			"textura": preload("res://icon.svg"),
			"efeito": "forte",
			"forca": 30
		})
		Inventario.moedas -= 10
func _on_buy_spd_pt_pressed() -> void:
	if Inventario.moedas - 25 >= 0: 
		Inventario.adicionar_item({
			"nome": "spd_pot",
			"quantidade": 1,
			"textura": preload("res://icon.svg"),
			"efeito": "speed",
			"forca": 50
		})
		Inventario.moedas -= 10
func _on_buy_life_pt_pressed() -> void:
	if Inventario.moedas - 10 >= 0: 
		Inventario.adicionar_item({
			"nome": "life_pot",
			"quantidade": 1,
			"textura": preload("res://icon.svg"),
			"efeito": "curar",
			"forca": 30
		})
		Inventario.moedas -= 10
