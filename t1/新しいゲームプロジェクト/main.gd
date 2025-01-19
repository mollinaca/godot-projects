extends Node2D

## キャプションのラベルを取得する
@onready var _label = $Label

func _process(delta: float) -> void:
	
	# たこ焼きの生存数をカウントする.
	var cnt = 0
	for child in get_children():
		# ノード名に "Tako" が含まれているかどうか.
		if "Tako" in child.name:
			cnt += 1
	
	if cnt == 0:
		# たこ焼きが全滅した.
		# ゲームクリアキャプションを表示する
		_label.visible = true
