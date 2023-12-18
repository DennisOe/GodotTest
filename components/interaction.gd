extends Area2D


@onready var sprite: Sprite2D = get_node("Sprite2D")
@export var interaction_type: String = "None" # Player, Dialog
var interaction: bool = false

func _ready() -> void:
	# connect signals
	self.area_entered.connect(_on_area_entered)
	self.area_exited.connect(_on_area_exited)


func _physics_process(_delta: float) -> void:
	if not interaction:
		return
	if not Input.is_action_just_pressed("interact"):
		return
	sprite.visible = not sprite.visible
	interaction = sprite.visible


func _on_area_entered(_area: Area2D) -> void:
	if "Player" in interaction_type:
		sprite.texture = preload("res://art/dialogs.png")
		sprite.hframes = 4
		sprite.vframes = 3	
		sprite.frame = 0
		sprite.visible = true
	elif "Dialog" in interaction_type:
		sprite.texture = preload("res://art/dialogs.png")
		#sprite.frame = 1
	interaction = true
	
	
func _on_area_exited(_area: Area2D) -> void:
	sprite.visible = false
	interaction = false
