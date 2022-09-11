extends BaseState

export (float) var jump_force = 110
var start_time = 0.5
export (float) var move_speed = 100

export (NodePath) var jump_node
export (NodePath) var idle_node

onready var idle_state = get_node(idle_node)
onready var jump_state: BaseState = get_node(jump_node)

func enter() -> void:
	start_time = 0.5
	entity.animationBambu.play(animation_name)
	entity.animationHat.play("jump")
	entity.velocity.y = -jump_force


func input(event: InputEvent) -> BaseState:
	if Input.is_action_just_pressed("ui_up"):
		return jump_state
	
	return null


func physics_process(delta: float) -> BaseState:
	var new_state = test()
	if new_state:
		return  idle_state
	var move = 0
	if Input.is_action_pressed("ui_left"):
		move = -1
	elif Input.is_action_pressed("ui_right"):
		move = 1
	
	entity.velocity.x = move * move_speed
	entity.velocity.y += entity.gravity
	
	entity.velocity = entity.move_and_slide(entity.velocity, Vector2.UP)
	if start_time <= 0:
		if entity.velocity.y > 0:
			entity.animationBambu.play("bambu_fall")
		elif entity.velocity.x != 0:
			entity.animationBambu.play("bambu_walk")
		else:
			entity.animationBambu.play("bambu_idle")
	else:
		start_time -= delta
	
	return null


func test():
	if get_parent().get_parent().get_node("RayCast2D").is_colliding():
		return  idle_state


func exit():
	entity.animationBambu.play("bambu_exit")
