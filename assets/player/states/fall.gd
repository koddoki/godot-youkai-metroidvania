extends BaseState

export (float) var move_speed = 60
export var temp_gravity = 4
var can_jump = true

export (NodePath) var walk_node
export (NodePath) var idle_node
export (NodePath) var jump_node

onready var jump_state: BaseState = get_node(jump_node)
onready var walk_state: BaseState = get_node(walk_node)
onready var idle_state: BaseState = get_node(idle_node)


func enter():
	.enter()
	entity.animationHat.play(animation_name)
	coyote_jump()


func input(event: InputEvent) -> BaseState:
	if Input.is_action_just_pressed("ui_up"):
		if can_jump:
			return jump_state
	
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

	if entity.is_on_floor():
		if move != 0:
			return walk_state
		else:
			return idle_state
	return null


func coyote_jump():
	can_jump = true
	if get_parent().previous_state == jump_state:
		can_jump = false
		
	yield(get_tree().create_timer(.2),"timeout")
	can_jump = false


func exit():
	entity.gravity = temp_gravity

