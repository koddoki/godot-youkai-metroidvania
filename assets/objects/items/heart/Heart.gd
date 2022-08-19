extends Area2D



func _on_Heart_body_entered(body: Node) -> void:
	body.heal(25);
	queue_free();
