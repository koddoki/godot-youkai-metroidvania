extends KinematicBody2D

class_name Entity

var maxHealth = 100;
export var currentHealth = 100;

var regenTimer := Timer.new()
var poisonTimer := Timer.new()

# Buffs
var heal = 0
var poison = 1


func _ready() -> void:
	init_timers()
	#start_poison(5,10)


func _process(delta: float) -> void:
	if !regenTimer.is_stopped():
		regeneration(heal, delta);
	if !poisonTimer.is_stopped():
		poisoning(heal, delta);


func init_timers():
	add_child(regenTimer)
	regenTimer.one_shot = true
	
	add_child(poisonTimer)
	poisonTimer.one_shot = true

# ------ regeneration --------
func start_regen(_heal, time):
	regenTimer.wait_time = time
	regenTimer.start()
	heal = _heal


func regeneration(heal, delta):
	heal(heal * delta);


# ----------- poison --------
func start_poison(_poison, time):
	poisonTimer.wait_time = time
	poisonTimer.start()
	poison = _poison


func poisoning(poison, delta):
	print(poison * delta);
	dor(poison * delta);

func heal(health):
	currentHealth = currentHealth + health;
	$Hud.update(currentHealth, maxHealth);


func dor(damage):
	currentHealth = clamp(currentHealth - damage, 0, maxHealth);
	$Hud.update(currentHealth, maxHealth);
	print(currentHealth);
