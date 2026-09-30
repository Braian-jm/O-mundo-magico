extends CharacterBody2D
var vida = 10 
func _ready(): 
	pass
func _physics_process(delta: float) -> void:
	print("vida do inimigo: " + str(vida))
