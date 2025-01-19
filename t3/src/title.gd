extends Node2D

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		# メインシーンに切り替える
		get_tree().change_scene_to_file("res://main.tscn")
