extends BaseState

func input(_event: InputEvent) -> int:
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		print("Idle para Walk")
		return State.Walk;
	elif Input.is_action_just_pressed("ui_up"):
		return State.Jump;
	elif Input.is_action_just_pressed("hit"):
		return State.Attack;
	return State.Null;


func physics_process(_delta: float) -> int:
	#print("Idle")
	player.velocity.y += player.gravity;
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP);
	
	if !player.is_on_floor():
		return State.Fall;
	return State.Null;
