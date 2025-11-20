# Team_Manager.gd
extends Node2D
class_name Team_Manager


# piece array
var ALLIES: Array[PackedScene] = []
var ENEMIES: Array[PackedScene] = []
#ready
func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	_create_starting_pieces()
	


func _create_starting_pieces( ally_piece_names: Array[String] = [], enemy_piece_names: Array[String] = []) -> void:
	ALLIES.clear()
	ENEMIES.clear()
	var pm = GameManager.Piece_Manager
	
	if ally_piece_names.is_empty():
		ally_piece_names = pm.get_random_piece_names(3)

	if enemy_piece_names.is_empty():
		enemy_piece_names = pm.get_random_piece_names(3)

	for name in ally_piece_names:
		var scene: PackedScene = pm.get_piece(name)
		if scene:
			ALLIES.append(scene)
		else:
			push_warning("Unknown ally piece name: %s" % name)

	for name in enemy_piece_names:
		var scene: PackedScene = pm.get_piece(name)
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
