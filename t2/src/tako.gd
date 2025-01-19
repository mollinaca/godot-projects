extends Area2D

# 移動速度
const speed: float = 100

# タイルのサイズ
var tile_size: float = 8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # 特に初期化は不要

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Vector2.ZERO  # 方向ベクトルを初期化

	# WASDキーで入力をチェック
	if Input.is_key_pressed(KEY_W):   # Wキー
		direction.y -= 1
	if Input.is_key_pressed(KEY_A):   # Aキー
		direction.x -= 1
	if Input.is_key_pressed(KEY_S):   # Sキー
		direction.y += 1
	if Input.is_key_pressed(KEY_D):   # Dキー
		direction.x += 1

	# 入力に基づいて移動
	if direction != Vector2.ZERO:
		direction = direction.normalized()  # 方向を正規化（斜め移動でも1マスの距離になるように）
		position += direction * tile_size  # 1マスの距離だけ移動
	#else:
#		print("No input detected")  # 入力がない場合にメッセージを表示
