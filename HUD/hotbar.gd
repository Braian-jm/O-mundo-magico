extends Control

# preload carrega a cena do slot em tempo de compilação (uma vez só),
# pra podermos instanciar (criar cópias) dela quantas vezes quisermos depois.
const SlotCena = preload("res://HUD/slot.tscn") # ajuste o caminho conforme onde você salvou

@onready var slots_container: HBoxContainer = $SlotsContainer

# Array pra guardar as referências dos slots visuais já criados.
var slots_visuais: Array = []

func _ready() -> void:
	criar_slots_visuais()
	
	# Conecta nossa função "atualizar_visual" ao sinal do Inventario.
	# Isso significa: toda vez que Inventario.inventario_alterado.emit() rodar,
	# a função atualizar_visual() abaixo é chamada automaticamente.
	Inventario.inventario_alterado.connect(atualizar_visual)
	
	atualizar_visual() # desenha o estado inicial (provavelmente tudo vazio)

func criar_slots_visuais() -> void:
	for i in range(Inventario.NUMERO_DE_SLOTS):
		var novo_slot = SlotCena.instantiate() # cria uma cópia da cena slot.tscn
		slots_container.add_child(novo_slot) # adiciona como filho do HBoxContainer
		slots_visuais.append(novo_slot)

func atualizar_visual() -> void:
	for i in range(slots_visuais.size()):
		if i < Inventario.slots.size() and not Inventario.slots[i].is_empty():
			slots_visuais[i].definir_item(Inventario.slots[i])
		else:
			slots_visuais[i].limpar()
