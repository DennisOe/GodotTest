extends CharacterBody2D


@export var speed: int = 50
@onready var animation: AnimationPlayer = get_node("AnimationPlayer")


func handle_input() -> void:
	var move_direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = move_direction * speed


func update_animation() -> void:
	if not velocity.length():
		if animation.is_playing():
			animation.stop()
	else:	
		var direction: String = "Down"
		if velocity.x < 0:
			direction = "Left"
		elif velocity.x > 0:
			direction = "Right"
		elif velocity.y < 0:
			direction = "Up"	
		animation.play("walk" +  direction)


func _physics_process(_delta: float) -> void:
	handle_input()
	move_and_slide()
	update_animation()
