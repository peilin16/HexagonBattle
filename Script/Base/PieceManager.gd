extends Node2D
class_name Piece_Manger

@export var hex_manager: Hex_Manger        # 在 Inspector 里拖引用
@export var piece_scene: PackedScene       # 指向 PieceUnit.tscn

func _ready() -> void:
	# example：spawn test piece at (0, 1)
	#spawn_piece_on_cell(Vector2i(0, 1), "Player", Piece.TEAM.PLAYER)
	pass




func spawn_piece_on_cell(cell: Vector2i, scenes) -> void:
	var map = GameManager.Hex_Manager.get_map();
	if map == null:
		push_warning("TileMapLayer not registered in Hex_Manger.")
		return
	
	# 3. init scenes
	var piece_unit: Test_Piece_Controller = piece_scene.instantiate()
	add_child(piece_unit)

	# 4. bind data
	#piece_unit.data = piece_data
	#piece_unit.place_on_hex(cell, map)
