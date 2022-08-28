extends BaseState

export(int) var move_speed = 60;

func physics_process(_delta: float) -> int:
	#print("Queda Livre")
	var move = 0;
	if Input.is_action_pressed("ui_left"):
		move = -1;
	if Input.is_action_pressed("ui_right"):
		move = 1;
	player.velocity.x = move * move_speed;
	player.velocity.y += player.gravity;
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP);
	
	if player.is_on_floor():
		if move != 0:
			return State.Walk;
		else:
			return State.Idle;
	return State.Null;
