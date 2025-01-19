extends Sprite2D

# 演出速度.
const SPEED = 37*2 # 37パターンで1秒,

# 経過時間.
var _pasttime = 0.0

## 更新.
func _process(delta: float) -> void:
	# 経過時間を足し込む.
	_pasttime += delta
	
	frame = int(_pasttime * SPEED)
	if frame >= 38:
		# アニメーションが終わったら消す.
		queue_free()
