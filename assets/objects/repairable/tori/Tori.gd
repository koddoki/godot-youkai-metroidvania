extends Area2D

var toriHealth = 5;


func receiveItem(_itemName):
	pass

func restore(_value):
	pass


func hit():
	$AnimationPlayer.play("repair")
	print("ahhhhhhhhhh socorro")
