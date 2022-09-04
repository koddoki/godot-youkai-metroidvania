class_name BaseState
extends Node


export (String) var animation_name;

# Pass in a reference to the kinematic body
# so that it can be used by the state

var entity

func enter() -> void:
	entity.animation.play(animation_name)


func exit() -> void:
	pass


func input(event: InputEvent) -> BaseState:
	return null


func process(delta: float) -> BaseState:
	return null


func physics_process(delta: float) -> BaseState:
	return null


