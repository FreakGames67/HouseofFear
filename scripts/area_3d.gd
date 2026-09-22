extends Area3D
@onready var crucifixion: Node3D = $"../CameraPivot/Crucifixion"

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("Item"):
		crucifixion.visible = true
