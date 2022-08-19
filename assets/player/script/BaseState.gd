class_name BaseState
extends Node

# This enum is used so that each child state can reference
# each other for its return value
enum State {
	Null,
	Idle,
	Walk,
	Jump,
	Fall,
	Attack
}

export (String) var animation_name;

# Pass in a reference to the player's kinematic body
# so that it can be used by the state

var player: Player;

func enter() -> void:
	player.animation.play(animation_name);
	player.hat.play(animation_name);


func exit() -> void:
	pass;


# Enums are internally stored as ints,
# so that is the expected return type
# warning-ignore:unused_argument
func input(event: InputEvent) -> int:
	return State.Null;


# warning-ignore:unused_argument
func process(delta: float) -> int:
	return State.Null;


# warning-ignore:unused_argument
func physics_process(delta: float) -> int:
	return State.Null;


