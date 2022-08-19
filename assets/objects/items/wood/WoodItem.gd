extends Area2D

class_name WoodItem

#var inventory : Inventory;

#var inventory = load("res://assets/ui/hud/inventoryframe/Inventory.tscn").instance()

var woodPos;

signal requestPosition;


func _ready() -> void:
	
	#inventory.connect("woodPosition", self,"_receive_ItemFrame_Position(pos)" )
	#emit_signal("requestPosition");
	
	# Starts the animation
	$AnimationWoodItem.play("bounce");
	$AnimationFrame.play("idle");


func _on_WoodItem_body_entered(body: Node) -> void:
	pass
	#var tw = create_tween();
	#tw.tween_property(self, position, woodPos, 0.5)
	
func _receive_ItemFrame_Position(pos):
	pass
	#woodPos = pos;
	
