extends MoveState

export (NodePath) var bambuLegs_node

onready var bambuLegs_state : BaseState = get_node(bambuLegs_node)

func enter():
	.enter()
	entity.animationHat.play(animation_name)


func input(event: InputEvent) -> BaseState:
	# First run parent code and make sure we don't need to exit early
	# based on its logic
	if Input.is_action_just_pressed("duro"):
		return bambuLegs_state
	var new_state = .input(event)
	if new_state:
		return new_state
	
	return null
