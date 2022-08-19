extends Node

# using enums for state names that way every script has the
# same interface while being more robust and less error prone
# than using strings
onready var states = {
	BaseState.State.Idle: $Idle,
	BaseState.State.Walk: $Walk,
	BaseState.State.Jump: $Jump,
	BaseState.State.Fall: $Fall,
}

var current_state: BaseState;

func change_state(new_state: int) ->void:
	if current_state:
		current_state.exit();
	
	current_state = states[new_state];
	current_state.enter();


# Initialize the state machine by giving each state a
# reference to the objects owned by the parent that they
# should be able to take control of and set a default state
func init(player: Player) -> void:
	print("Ala o init")
	for child in get_children():
		child.player = player;
	#Initialize with a default state of idle
	change_state(BaseState.State.Idle);


# Pass through functions for the Player to call, 
# handling state changes as needed
func physics_process(delta: float) -> void:
	var new_state = current_state.physics_process(delta)
	if new_state != BaseState.State.Null:
		change_state(new_state)


func input(event: InputEvent) -> void:
	var new_state = current_state.input(event)
	if new_state != BaseState.State.Null:
		change_state(new_state);
