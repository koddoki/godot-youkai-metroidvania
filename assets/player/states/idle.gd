extends BaseState

export (NodePath) var jump_node
export (NodePath) var fall_node
export (NodePath) var walk_node
export (NodePath) var bambuLegs_node

onready var bambuLegs_state : BaseState = get_node(bambuLegs_node)
onready var jump_state: BaseState = get_node(jump_node)
onready var fall_state: BaseState = get_node(fall_node)
onready var walk_state: BaseState = get_node(walk_node)

func enter() -> void:
	.enter()
	entity.animationHat.play(animation_name)
	entity.velocity.x = 0

func input(event: InputEvent) -> BaseState:
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		return walk_state
	elif Input.is_action_just_pressed("ui_up"):
		return jump_state
	elif Input.is_action_just_pressed("duro"):
		return bambuLegs_state
	return null

func physics_process(delta: float) -> BaseState:
	entity.velocity.y += entity.gravity
	entity.velocity = entity.move_and_slide(entity.velocity, Vector2.UP)

	if !entity.is_on_floor():
		return fall_state
	return null
