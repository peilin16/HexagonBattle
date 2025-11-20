extends Piece_Controller
class_name Test_Piece_Controller





func _ready() -> void:
	_piece_name = "Test_Piece";
	_piece = Piece.new()
#	_piece.name = "TestPiece"
	_piece.Team = Piece.TEAM.ALLY;
	GameManager.Piece_Manager._register_piece(self);
	
