extends CharacterBody2D

const SPEED = 500


func _physics_process(delta):
	velocity.x = Input.get_axis("left", "right")
	velocity.y = Input.get_axis("up", "down")
	velocity = velocity.normalized()*SPEED
	move_and_slide()
