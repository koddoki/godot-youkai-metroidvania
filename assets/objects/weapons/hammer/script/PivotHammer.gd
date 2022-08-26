extends Node2D

onready var hammer = $Hammer;

var max_dist = 15;
var cooldown = 2;

var normal_attack = 20
var heavy_attack = 40
var attack = normal_attack


var hammer_position
var can_attack = true
var can_relese = false
onready var attack_timer = get_node("attackCooldown")
onready var effect = get_parent().get_node("Particles2D")


func _ready():
	attack_timer.connect("timeout",self,"_on_attack_timer_timeout")
	attack_timer.wait_time = cooldown
	$AnimationCooldown.playback_speed /= cooldown


func _process(_delta):
	set_weapon_position()
	hit()


func set_weapon_position():
	var parent_pos = get_parent().global_position
	var mouse_pos = get_global_mouse_position()
	var diff_pos = mouse_pos - parent_pos
	diff_pos = diff_pos.limit_length(max_dist)
	hammer_position = parent_pos + diff_pos
	
	global_position = hammer_position


func hit():
	if Input.is_action_pressed("hammer_hit") and can_attack:
		$AnimationHammer.play("charge")
		can_attack = false
		can_relese = true
		
	if Input.is_action_just_released("hammer_hit") and can_relese:
		if $AnimationHammer.is_playing():
			attack = normal_attack
			$AnimationHammer.play("hit");
		else:
			effect.global_position = hammer_position + Vector2(0,-14)
			attack = heavy_attack
			$AnimationHammer.play("heavy_hit");
		can_relese = false
		can_attack = false
		attack_timer.start()
		$AnimationCooldown.play("attack_cooldown_bar")



func _on_attack_timer_timeout():
	can_attack = true


func _on_Area2D_body_entered(body):
	body.hit(attack)
