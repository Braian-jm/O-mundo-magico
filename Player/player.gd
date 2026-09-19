extends CharacterBody2D
@export var gravity:float;
@export var SPEED = 200; 
var max_health;
var vida_atual;
var max_mana;
var dano;
var classe_atual:CharacterClass 
func _ready() -> void:
	aplly_class(Classes.selected_class)
	Inventario.adicionar_item({
		"nome": "life_pot",
		"quantidade": 2,
		"textura": preload("res://icon.svg"),
		"efeito": "curar",
		"forca": 30
	})
func _input(event: InputEvent) -> void:
	vida_atual = max_health
	if Input.is_action_just_pressed("ui_accept") and is_on_floor(): 
		velocity.y = -300;
		print(velocity)
	for i in range(8):
		if Input.is_action_just_pressed("hotbar_" + str(i + 1)):
			usar_item_da_hotbar(i)
func _physics_process(delta: float) -> void:
	var direcao = Input.get_axis("A","D");
	velocity.x = direcao * SPEED
	if not is_on_floor(): 
		velocity.y += gravity * delta; 
	move_and_slide()
func aplly_class(data: CharacterClass): 
	classe_atual = data
	max_health = data.max_health
	max_mana = data.max_mana
	dano = data.strength
	SPEED = data.speed
	print(SPEED)
func usar_item_da_hotbar(indice: int) -> void:
	if indice < 0 or indice >= Inventario.slots.size():
		return
	var item = Inventario.slots[indice]
	if item.is_empty():
		return
	
	usar_item(item) # faltava isso
	Inventario.remover_item(indice, 1) # consome uma unidade do item (opcional, mas provavelmente você quer isso)
func usar_item(item: Dictionary): 
	match item.get("efeito", ""): 
		"curar": 
			vida_atual += item.get("forca", 0)
			print(vida_atual)
