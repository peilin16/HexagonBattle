extends Piece_Controller
class_name Test_Piece_Controller


@export var _piece: Piece        
#var hex_coord: Vector2i       
#var position: Vector2i;
func _ready() -> void:
	_piece = Piece.new()
	_piece.name = "TestPiece"
	_piece.Team = Piece.TEAM.PLAYER;
	GameManager.Piece_Manager.spawn_piece(self, Vector2i(2, 2)); #specify the cell
