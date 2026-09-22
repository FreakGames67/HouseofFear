extends Node3D

@onready var crucifixion: Node3D = $Crucifixion


func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("Player"):
		crucifixion.visible = false
