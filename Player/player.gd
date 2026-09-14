extends CharacterBody2D
@export var gravity:float;
@export var SPEED = 200; 
var max_health;
var max_mana;
var dano;
var classe_atual:CharacterClass 
func _ready() -> void:
	aplly_class(Classes.selected_class)
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and is_on_floor(): 
		velocity.y = -300;
		print(velocity)
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
