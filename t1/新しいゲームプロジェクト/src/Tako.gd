## ①Area2Dノードを使用する.
extends Area2D

## 爆発シーンを読み込む
const EXPLOSION_OBJ = preload("res://src/Explosion.tscn")

## ②定数の定義.
## 移動速度.
const MOVE_SPEED = 200

## ③クラス変数の定義
## 画面サイズ.
var _screen = Rect2()

## 移動量.
var _velocity = Vector2()

## ④開始処理.
func _ready() -> void:
	# 画面サイズを取得.
	_screen = get_viewport_rect()
	
	# 移動速度をランダムで決定.
	_velocity.x = randf_range(-1, 1)
	_velocity.y = randf_range(-1, 1)

## ⑤更新.
func _process(delta: float) -> void:
	# 移動処理.
	position += _velocity * MOVE_SPEED * delta

	# 画面端での跳ね返り判定.
	if position.x < 0:
		position.x = 0
		_velocity.x *= -1 # 移動量(X)を反転
	if position.y < 0:
		position.y = 0
		_velocity.y *= -1 # 移動量(Y)を反転
	if position.x > _screen.size.x:
		position.x = _screen.size.x
		_velocity.x *= -1 # 移動量(X)を反転
	if position.y > _screen.size.y:
		position.y = _screen.size.y
		_velocity.y *= -1 # 移動量(Y)を反転


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		# マウスの入力があった
		if event.is_pressed():
			# 爆発エフェクトを再生.
			var explosion = EXPLOSION_OBJ.instantiate()
			# 同じ座標に移動.
			explosion.position = position
			# ルートノードに爆発オブジェクトを登録する
			get_tree().root.add_child(explosion)
			
			# オブジェクトを消す
			queue_free()
