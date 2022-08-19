extends Node2D

onready var hammer = $Hammer;

var max_dist = 10;

func _process(_delta):
	var mouse_pos = get_local_mouse_position();
	var dir = Vector2.ZERO.direction_to(mouse_pos);
	var dist = mouse_pos.length();
	hammer.position = dir * min(dist, max_dist);
	hit();
	
func hit():
	if Input.is_action_just_pressed("hammer_hit"):
		$AnimationHammer.play("hit")
	if Input.is_action_just_released("hammer_hit"):
		$AnimationHammer.play("relax");
