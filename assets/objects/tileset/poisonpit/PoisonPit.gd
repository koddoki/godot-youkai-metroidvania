extends Area2D

var group;

func _process(delta):
	group = get_overlapping_bodies();
	for i in group:
		i.add_effect("poison", 3, 3);
