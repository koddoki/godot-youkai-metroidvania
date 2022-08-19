extends BaseState

export (float) var jump_force = 200;
export (float) var move_speed = 60;

func enter() -> void:
	# This calls the base class enter function, which is
	# necessary here to make sure the animation swithces
	.enter()
	player.velocity.y = -jump_force;


func physics_process(delta: float) -> int:
	#print("Pulo Pulinho")
	var move = 0;
	if Input.is_action_pressed("ui_left"):
		move = -1;
	elif Input.is_action_pressed("ui_right"):
		move = 1;
	player.velocity.x = move * move_speed;
	player.velocity.y += player.gravity;
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP);
	
	if player.velocity.y > 0:
		return State.Fall;
	
	if player.is_on_floor():
		if move != 0:
			return State.Walk;
		else:
			return State.Idle;
	return State.Null;
