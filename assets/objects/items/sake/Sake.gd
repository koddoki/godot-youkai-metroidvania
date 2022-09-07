extends Area2D


func _on_Sake_body_entered(body: Node) -> void:
	body.add_effect("regeneration", 2, 5)
	queue_free();

