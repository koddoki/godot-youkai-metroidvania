extends Entity

export var speed = 50
var direction = 1
var velocity = Vector2()
const GRAVITY = 4;

func _physics_process(delta):
	velocity.y += GRAVITY;
	velocity.x = direction * speed;
	velocity = move_and_slide(velocity, Vector2.UP);
	if is_on_wall():
		direction = direction * (-1);



func _on_DamageArea_body_entered(body: Node) -> void:
	body.dor_collision(global_position);
