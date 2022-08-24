extends Node2D

var woodTotal = 0;
var stoneTotal = 0;
var paperTotal = 0;
var beanTotal = 0;


func _ready() -> void:
	updateInventory()

func updateInventory():
	updateLabel();
	updateModulate();

func updateLabel():
	$WoodFrame/Label.text = String(woodTotal);
	$StoneFrame/Label.text = String(stoneTotal);
	$PaperFrame/Label.text = String(paperTotal);
	$BeanFrame/Label.text = String(beanTotal);

func updateModulate():
	if woodTotal > 0:
		$WoodFrame/Wood.modulate = Color(1,1,1,1);
	if stoneTotal > 0:
		$StoneFrame/Stone.modulate = Color(1,1,1,1);
	if paperTotal > 0:
		$PaperFrame/Paper.modulate = Color(1,1,1,1);
	if beanTotal > 0:
		$BeanFrame/Bean.modulate = Color(1,1,1,1);

func addItem(value, itemName):
	if itemName == "bean":
		beanTotal = beanTotal + value;
		updateInventory();
	if itemName == "paper":
		paperTotal = paperTotal + value;
		updateInventory();
	if itemName == "stone":
		stoneTotal = stoneTotal + value;
		updateInventory();
	if itemName == "wood":
		woodTotal = woodTotal + value;
		updateInventory(); 
