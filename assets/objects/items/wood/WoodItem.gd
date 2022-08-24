extends Area2D

class_name Item

export (int) var value = 5;
export (String, "bean", "paper", "stone", "wood") var itemName = "bean"

func _ready() -> void:
	#emit_signal("collected",global_position);
	
	$Bounce/Frame.play(itemName);
	$Bounce/Item.play(itemName);
	$AnimationWoodItem.play("bounce");
	$AnimationFrame.play("idle");


func _on_WoodItem_body_entered(body: Node) -> void:
	if body.name == "Player":
		body.itemCollected(value,itemName);
	queue_free();
	#var tw = create_tween();
	#tw.tween_property(self, position, woodPos, 0.5)
