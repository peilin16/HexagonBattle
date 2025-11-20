extends Piece_Controller
class_name Test_Piece_Controller





func _ready() -> void:
	_piece_name = "Test_Piece";
	self.z_index = 10 
	_piece = Piece.new()
#	_piece.name = "TestPiece"
	_piece.Team = Piece.TEAM.PLAYER;
	GameManager.Piece_Manager._register_piece(self);
	
