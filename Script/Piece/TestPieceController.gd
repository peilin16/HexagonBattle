extends Node2D
class_name Test_Piece_Controller


@export var _piece: Piece        
var hex_coord: Vector2i       
#var position: Vector2i;
func _ready() -> void:
	# 1. create piece
	_piece = Piece.new()
	_piece.name = "Player"
	_piece.Team = Piece.TEAM.PLAYER;
	var hex =GameManager.Hex_Manager.get_hex_at(Vector2i(0, 1));
	_piece.hexagon = hex;
	

func place_on_hex(cell: Vector2i, map: TileMapLayer) -> void:
	hex_coord = cell
	# piece position → local pos → to local
	var local_pos: Vector2 = map.map_to_local(cell)
	global_position = map.to_global(local_pos)
