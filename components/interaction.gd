extends Area2D


@onready var sprite: Sprite2D = get_node("Sprite2D")
@export_file var texture_path: String = "None"
@export var h_frames: int = 0
@export var v_frames: int = 0
@export var frame: int = 0
@export var xy_position: Vector2 = Vector2(0, 0)
@export var visibility: bool = false


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
	sprite.texture = load(texture_path)
	sprite.hframes = h_frames
	sprite.vframes = v_frames
	sprite.frame = frame
	sprite.position = xy_position
	sprite.visible = visibility	
	interaction = true
	
	
func _on_area_exited(_area: Area2D) -> void:
	sprite.visible = false
	interaction = false
