extends BaseState

export (float) var jump_force = 200
export (float) var move_speed = 100
export (NodePath) var fall_node
export (NodePath) var walk_node
export (NodePath) var idle_node

onready var fall_state: BaseState = get_node(fall_node)
onready var walk_state: BaseState = get_node(walk_node)
onready var idle_state: BaseState = get_node(idle_node)


func enter() -> void:
	# This calls the base class enter function, which is necessary here
	# to make sure the animation switches
	.enter()
	entity.animationHat.play(animation_name)
	entity.velocity.y = -jump_force


func input(event: InputEvent) -> BaseState:
	if Input.is_action_just_released("ui_up"):
		entity.gravity *= 2
		return fall_state
	
	return null


func physics_process(delta: float) -> BaseState:
	var move = 0
	if Input.is_action_pressed("ui_left"):
		move = -1
	elif Input.is_action_pressed("ui_right"):
		move = 1
	
	entity.velocity.x = move * move_speed
	entity.velocity.y += entity.gravity
	entity.velocity = entity.move_and_slide(entity.velocity, Vector2.UP)
	
	if entity.velocity.y > 0:
		return fall_state
	
	if entity.is_on_floor():
		if move != 0:
			return walk_state
		return idle_state
	
	return null
