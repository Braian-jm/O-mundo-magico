extends Node2D
@onready var esquerda: Area2D = $esquerda
@onready var direita: Area2D = $direita
@onready var duracao: Timer = $duracao
var inimigo_area

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	esquerda.visible = false
	direita.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if duracao.time_left <= 0: 
		esquerda.visible = false; 
		direita.visible = false; 




func _on_esquerda_body_entered(body: Node2D) -> void:
	if body.is_in_group("inimigo"): 
		inimigo_area = body
		print("olar" + inimigo_area)
func _on_direita_body_entered(body: Node2D) -> void:
	if body.is_in_group("inimigo"): 
		inimigo_area = body
		print("olar" + inimigo_area)
func _on_direita_body_exited(body: Node2D) -> void:
	if body.is_in_group("inimigo"): 
		inimigo_area = ""
func _on_esquerda_body_exited(body: Node2D) -> void:
	if body.is_in_group("inimigo"): 
		inimigo_area = ""

func atacar(): 
	duracao.start(1);
	esquerda.visible = true
	direita.visible = true
	if inimigo_area and inimigo_area.is_in_group("inimigo"): 
		inimigo_area.vida -= 1; 
