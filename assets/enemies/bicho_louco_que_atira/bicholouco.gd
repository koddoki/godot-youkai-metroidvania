extends Entity


export var speed = 5
var direction = Vector2()
var velocity = Vector2()


func _physics_process(delta):
	velocity = direction * speed
	velocity = move_and_slide(velocity)


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		direction.x = 1


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		direction.x = 0
