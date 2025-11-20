extends Resource
class_name Piece
#piece information vessel
enum TEAM{ALLY, ENEMY}

@export var hexagon : Hexagon;
@export var target : String;
@export var Team: TEAM = TEAM.ALLY;
@export var position: Vector2i
@export var piece_data: Piece_data
func _init()->void:
	piece_data  = Piece_data.new();
