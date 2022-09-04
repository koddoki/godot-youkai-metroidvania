class_name MoveState
extends BaseState

export (float) var move_speed = 100
export (NodePath) var jump_node
export (NodePath) var fall_node
export (NodePath) var idle_node
export (NodePath) var walk_node

onready var jump_state: BaseState = get_node(jump_node)
onready var fall_state: BaseState = get_node(fall_node)
onready var idle_state: BaseState = get_node(idle_node)
onready var walk_state: BaseState = get_node(walk_node)

func input(event: InputEvent) -> BaseState:
	if Input.is_action_just_pressed("ui_up"):
		return jump_state

	return null

func physics_process(delta: float) -> BaseState:
	if !entity.is_on_floor():
		return fall_state

	var move = get_movement_input()
	
	entity.velocity.y += entity.gravity
	entity.velocity.x = move * move_speed
	entity.velocity = entity.move_and_slide(entity.velocity, Vector2.UP)
	
	if move == 0:
		return idle_state

	return null

func get_movement_input() -> int:
	if Input.is_action_pressed("ui_left"):
		return -1
	elif Input.is_action_pressed("ui_right"):
		return 1
	
	return 0
