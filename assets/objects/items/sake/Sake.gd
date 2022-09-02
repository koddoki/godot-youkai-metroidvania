extends Area2D


func _on_Sake_body_entered(body: Node) -> void:
	body.start_regen(2,5);
	queue_free();

