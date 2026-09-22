extends Node3D

enum AnimationState {IDLE, WALK, ATTACK}
var animation_state : int = AnimationState.IDLE

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse_click"):
		animation_state = AnimationState.ATTACK
	update_weapon_animations(delta)

func update_weapon_animations(delta: float) -> void:
	if AnimationState.ATTACK:
		animation_player.play("attack")
