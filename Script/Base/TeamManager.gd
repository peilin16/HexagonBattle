# Team_Manager.gd
extends Node2D
class_name Team_Manager


# piece array
var ALLIES: Array[Piece_Controller] = []
var ENEMIES: Array[Piece_Controller] = []
#ready
func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	_create_random_starting_pieces()
	ALLIES.clear()
	ENEMIES.clear()


#append random piece from dictonary
func _create_random_starting_pieces(alley_num:int = 3, enemy_num:int = 3)->void:
	var pm = GameManager.Piece_Manager
	var ally_piece_names = pm.get_random_piece_names(3);
	var enemy_piece_names = pm.get_random_piece_names(3);
	_create_starting_pieces(ally_piece_names,enemy_piece_names);
	
#append specify piece from dictonary 
func _create_starting_pieces( ally_piece_names: Array[String], enemy_piece_names: Array[String]) -> void:

	var pm = GameManager.Piece_Manager
	for name in ally_piece_names:
		var scene: Piece_Controller = pm.get_piece(name)
		if scene:
			ALLIES.append(scene)
		else:
			push_warning("Unknown ally piece name: %s" % name)

	for name in enemy_piece_names:
		var scene: Piece_Controller = pm.get_piece(name)
		if scene:
			ENEMIES.append(scene)
		else:
			push_warning("Unknown enemy piece name: %s" % name)



#regist team
func register_piece(piece: PackedScene) -> void:
	match piece.Team:
		Piece.TEAM.ALLY:
			ALLIES.append(piece)
		Piece.TEAM.ENEMY:
			ENEMIES.append(piece)


# draw ally
func draw_ally() -> PackedScene:
	if ALLIES.is_empty():
		return null
	return ALLIES.pop_front()

func draw_enemy() -> PackedScene:
	if ENEMIES.is_empty():
		return null
	return ENEMIES.pop_front()
