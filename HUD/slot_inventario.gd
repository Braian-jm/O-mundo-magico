extends PanelContainer

# @onready busca o nó assim que esse Slot entra na árvore de cena.
# O caminho "$Icone" significa "meu filho direto chamado Icone".
@onready var icone: TextureRect = $icone
@onready var quantidade_label: Label = $amount

# Guarda os dados do item que este slot está mostrando atualmente.
# Um Dictionary vazio {} representa "slot vazio".
var item_atual: Dictionary = {}

func definir_item(item: Dictionary) -> void:
	item_atual = item
	# "textura" e "quantidade" são chaves que vamos definir no Dictionary do item.
	icone.texture = item.get("textura", null)
	var qtd = item.get("quantidade", 1)
	
	# Só mostra o número se for maior que 1 (item único não precisa de "x1")
	if qtd > 1:
		quantidade_label.text = "x" + str(qtd)
		quantidade_label.visible = true
	else:
		quantidade_label.visible = false
	
	# Deixa o slot visível (caso estivesse "apagado" de um limpar() anterior)
	icone.visible = true

func limpar() -> void:
	item_atual = {}
	icone.texture = null
	icone.visible = false
	quantidade_label.visible = false
