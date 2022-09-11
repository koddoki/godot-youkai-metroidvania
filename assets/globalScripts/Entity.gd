extends KinematicBody2D

class_name Entity

var maxHealth = 100;
export var currentHealth = 100;


var activated_effects = {
	#"poison": {"quantity":1 ,"time":10}
}
var effects = {
	"poison" : funcref(self,"poison"),
	"regeneration" : funcref(self,"regeneration")
}


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	apply_effects(delta)


func add_effect(type, quantity, time) -> void:
	activated_effects[type] = {"quantity":quantity, "time":time}


func apply_effects(delta: float) -> void:
	for effect in activated_effects:
		effects[effect].call_func(activated_effects[effect], delta, effect)


func effect_timer(time: float, delta: float, type: String) -> float:
	time -= delta
	if time <= 0:
		activated_effects.erase(type)
	return time


func poison(effect, delta, type) -> void:
	effect["time"] = effect_timer(effect["time"], delta, type)
	if effect["time"] <= 0:
		print("fim do effeito:" + type)
		
	dor(effect["quantity"] * delta)


func regeneration(effect, delta, type) -> void:
	effect["time"] = effect_timer(effect["time"], delta, type)
	if effect["time"] <= 0:
		print("fim do effeito:" + type)
		
	heal(effect["quantity"] * delta)


func heal(health):
	currentHealth = currentHealth + health;
	$Hud.update(currentHealth, maxHealth);


func dor(damage):
	currentHealth = clamp(currentHealth - damage, 0, maxHealth);
	$Hud.update(currentHealth, maxHealth);
	print(currentHealth);
