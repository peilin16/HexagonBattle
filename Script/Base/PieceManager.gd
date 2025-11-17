extends Node2D
class_name Piece_Manger

@export var hex_manager: Hex_Manger        # 
@export var piece_scene: PackedScene       # 

var piece_to_unit: Dictionary = {}     # Piece -> cell
var selected_piece: Piece = null       #
func _ready() -> void:
	# example：spawn test piece at (0, 1)
	#spawn_piece_on_cell(Vector2i(0, 1), "Player", Piece.TEAM.PLAYER)
	pass




func spawn_piece(piece_unit: Test_Piece_Controller, cell: Vector2i) -> void:
	var map = GameManager.Hex_Manager.get_map()
	if map == null:
		push_warning("TileMapLayer not registered in Hex_Manger.")
		return

	# 1. add child node
	add_child(piece_unit)

	# 2. 
	var local_pos: Vector2 = map.map_to_local(cell)
	# 3. transfer to global position
	piece_unit.global_position = map.to_global(local_pos)

	# 4. bind Hexagon information
	var hex = GameManager.Hex_Manager.get_hex_at(cell)
	hex.piece = piece_unit._piece;
	piece_unit._piece.hexagon = hex;
func place_piece(piece:Piece, position: Vector2i)->void:
	pass
