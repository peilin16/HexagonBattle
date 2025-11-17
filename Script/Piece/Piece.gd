extends Resource
class_name Piece
#piece information vessel
enum TEAM{PLAYER, ENEMY}
@export var hexagon : Hexagon;
@export var name : String;
@export var Team: TEAM = TEAM.PLAYER;
