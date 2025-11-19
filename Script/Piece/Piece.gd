extends Resource
class_name Piece
#piece information vessel
enum TEAM{PLAYER, ENEMY}

@export var hexagon : Hexagon;
@export var target : String;
@export var Team: TEAM = TEAM.PLAYER;
@export var position: Vector2i
@export var piece: Piece_data
