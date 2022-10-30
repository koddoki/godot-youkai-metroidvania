class_name Player

extends Entity

var gravity = 100;
var velocity = Vector2.ZERO;
onready var mouse = get_global_mouse_position();

onready var flip = $Flip;
onready var animation = $AnimationPlayer;
onready var animationHat = $AnimationHat
onready var animationBambu = get_node("AnimationBambu")
onready var states = $state_manager;


func _ready() -> void:
	$Hud/HpFrame/TextureProgress.value = currentHealth;
	# Initialize the state machine, passing a reference of
	# the player to the states, that way they can move and
	# react accordingly
	states.init(self);
	$Hud.update(currentHealth, maxHealth);


func _unhandled_input(event: InputEvent) -> void:
	states.input(event);


func _physics_process(delta: float) -> void:
	f_flip();
	states.physics_process(delta);

func itemCollected(value, itemName):
	$Hud/Inventory.addItem(value, itemName);

func f_flip():
	mouse = get_global_mouse_position();
	if mouse < position:
		$Flip.scale.x = -1;
	else:
		$Flip.scale.x = 1;

func dor_collision(enemyPos: Vector2):
	Input.action_release("left")
	Input.action_release("right")
	var knockback_direction = enemyPos.direction_to(self.global_position)
	global_position += knockback_direction + Vector2(10,10);
	
	
	
#	velocity.y = -100
#	if position.x <= enemyPos.x:
#		velocity.x = -300
#	elif position.x > enemyPos.x:
#		velocity.x = 300
#	Input.action_release("left")
#	Input.action_release("right")
