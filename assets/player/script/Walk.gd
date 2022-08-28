extends BaseState

export (int) var move_speed = 100;

func input(_event: InputEvent) -> int:
	if Input.is_action_just_pressed("ui_up"):
		print("Ó o pulooo")
		return State.Jump;
	elif Input.is_action_just_pressed("hit"):
		return State.Attack;
	return State.Null;


func physics_process(_delta: float) -> int:
	#print("Walk")
	if !player.is_on_floor():
		return State.Fall;
	
	var move = 0;
	if Input.is_action_pressed("ui_left"):
		move = -1;
	elif Input.is_action_pressed("ui_right"):
		move = 1;
	
	
	player.velocity.y += player.gravity;
	player.velocity.x = move * move_speed;
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP);
	
	if move == 0:
		return State.Idle;
	
	return State.Null

