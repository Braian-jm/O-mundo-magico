class_name Classes
static var selected_class: CharacterClass;
static func guerreiro() -> CharacterClass: 
	var c := CharacterClass.new()
	c.display_name = "guerreiro"
	c.max_health = 20; 
	c.max_mana = 10; 
	c.strength = 15; 
	c.speed = 225
	c.weapon = "sword"
	return c
static func arqueiro() -> CharacterClass:
	var c := CharacterClass.new()
	c.display_name = "arqueiro"
	c.strength = 15
	c.max_health = 15; 
	c.max_mana = 15
	c.speed = 250
	return c 

static func mago() -> CharacterClass:
	var c := CharacterClass.new()
	c.display_name = "arqueiro"
	c.strength = 20
	c.max_health = 8; 
	c.max_mana = 20
	c.speed = 200
	return c 
