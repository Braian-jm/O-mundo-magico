extends Node

# Quantos slots a hotbar tem. Ajuste esse número como quiser.
const NUMERO_DE_SLOTS = 8

# Array de Dictionaries. Cada posição representa um slot.
# Um slot vazio é representado por um Dictionary vazio {}.
var slots: Array = []

func _ready() -> void:
	# Preenche o array com slots vazios na inicialização do jogo.
	for i in range(NUMERO_DE_SLOTS):
		slots.append({})
	
	# "emit_signal" ou o "emit" abaixo avisa qualquer interessado (a UI, por exemplo)
	# que o inventário mudou, sem o Inventario precisar saber quem está ouvindo.
	# Isso é chamado de "signal" (sinal) — um jeito de comunicação desacoplada no Godot.

# Sinal customizado: outros scripts podem "escutar" quando o inventário muda.
signal inventario_alterado

func adicionar_item(item: Dictionary) -> bool:
	# Primeiro, tenta empilhar em um slot que já tem o mesmo item (stack).
	for i in range(slots.size()):
		if not slots[i].is_empty() and slots[i].get("nome") == item.get("nome"):
			slots[i]["quantidade"] += item.get("quantidade", 1)
			inventario_alterado.emit()
			return true
	
	# Se não achou pra empilhar, procura um slot vazio.
	for i in range(slots.size()):
		if slots[i].is_empty():
			slots[i] = item.duplicate() # duplicate() evita que dois slots referenciem o mesmo Dictionary
			inventario_alterado.emit()
			return true
	
	# Não tinha espaço nenhum.
	print("Inventário cheio!")
	return false

func remover_item(index: int, quantidade: int = 1) -> void:
	if index < 0 or index >= slots.size():
		return
	if slots[index].is_empty():
		return
	
	slots[index]["quantidade"] -= quantidade
	if slots[index]["quantidade"] <= 0:
		slots[index] = {} # esvazia o slot
	
	inventario_alterado.emit()
