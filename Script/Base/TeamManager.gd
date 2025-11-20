# Team_Manager.gd
extends Node2D
class_name Team_Manager


# piece array
var ALLIES: Array[Node2D] = []
var ENEMIES: Array[Node2D] = []
#ready
func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	_create_starting_pieces()
	
#This method still in construction
func _create_starting_pieces() -> void:
	for i in 3:
		
		var ally := Piece.new()
		
		ally.piece_data.name = "Ally_%d" % i
		ally.Team = Piece.TEAM.PLAYER
		
		#var new_piece = GameManager.Piece_Manager.get_piece("Test_Piece");
		#new_piece._piece = ally;
		#ALLIES.append(new_piece)

	for i in 3:
		var enemy := Piece.new()
		enemy.piece_data.name = "Enemy_%d" % i
		enemy.Team = Piece.TEAM.ENEMY
		#var new_piece = GameManager.Piece_Manager.get_piece("Test_Piece");
		#new_piece._piece = enemy;
		#ALLIES.append(new_piece)

#regist team
func register_enemy_piece(piece: Piece) -> void:
	#piece.TEAM =Piece.
	ALLIES.append(piece)

	ENEMIES.append(piece)


# draw ally
func draw_ally() -> Piece:
	if ALLIES.is_empty():
		return null
	return ALLIES.pop_front()

func draw_enemy() -> Piece:
	if ENEMIES.is_empty():
		return null
	return ENEMIES.pop_front()
