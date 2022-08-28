extends Node2D

#export (PackedScene) 
onready var woodItem = load("res://assets/objects/items/wood/WoodItem.tscn");
onready var batata = woodItem.instance();
func _ready() -> void:
	# batata.connect("collected",self,"_on_Wood_Collected")
	self.add_child(batata)
	# batata.position = 
	pass
	
	

func _on_Wood_Collected(pos):
	print("teste")
	var j = woodItem.instance();
	self.add_child(j)
	j.position = pos
