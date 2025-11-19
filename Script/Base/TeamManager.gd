# Team_Manager.gd
extends Node2D
class_name Team_Manager

# piece array
var ALLIES: Array[Piece] = []
var ENEMIES: Array[Piece] = []

func _ready() -> void:
   
	_create_starting_pieces()


func _create_starting_pieces() -> void:
	for i in 3:
		var ally := Piece.new()
		ally.name = "Ally_%d" % i
		ally.Team = Piece.TEAM.PLAYER
		ALLIES.append(ally)

	for i in 3:
		var enemy := Piece.new()
		enemy.name = "Enemy_%d" % i
		enemy.Team = Piece.TEAM.ENEMY
		ENEMIES.append(enemy)


func register_piece(piece: Piece) -> void:
	match piece.Team:
		Piece.TEAM.PLAYER:
			ALLIES.append(piece)
		Piece.TEAM.ENEMY:
			ENEMIES.append(piece)


# draw 
func draw_ally() -> Piece:
	if ALLIES.is_empty():
		return null
	return ALLIES.pop_front()

func draw_enemy() -> Piece:
	if ENEMIES.is_empty():
		return null
	return ENEMIES.pop_front()
