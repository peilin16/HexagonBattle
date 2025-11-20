extends Node2D
class_name Piece_Manger

@export var hex_manager: Hex_Manger        # 

@export var piece_to_unit: Dictionary = {}     # Piece -> cell active piece
@export var piece_dict:Dictionary = {
	"Test_Piece": preload("res://Scenser/Piece_Scenser/test_piece.tscn")
	
	
	
}         # piece dict
var selected_piece: Piece = null       #
@export_dir var pieces_folder: String = "res://Scenser/Piece_Scenser"  
@export var sce: PackedScene   # bullet_scene

func _ready() -> void:
	# example：spawn test piece at (0, 1)
	#spawn_piece_on_cell(Vector2i(0, 1), "Player", Piece.TEAM.PLAYER)
	#_register_all_piece_scenes_from_folder();
	pass

			
func _register_piece(piece_unit)->void:
	if piece_dict.has(piece_unit._piece_name) == false:	
		piece_dict[piece_unit._piece_name] = piece_unit;


#get piece
func get_piece(piece_name:String):
	if not piece_dict.has(piece_name):	
		return
	var scene: PackedScene = piece_dict[piece_name];
	var instance: Piece_Controller = scene.instantiate()
	return instance;
	
#spawn piece
func spawn_piece(piece_unit: Test_Piece_Controller, cell: Vector2i) -> void:
	var map = GameManager.Hex_Manager.get_map()
	if map == null:
		push_warning("TileMapLayer not registered in Hex_Manger.")
		return
	
	# 1. add child node
	add_child(piece_unit)

	# 2. 
	var local_pos: Vector2 = map.map_to_local(cell)
	# 3. transfer to global position
	piece_unit.global_position = map.to_global(local_pos)

	# 4. bind Hexagon information
	var hex = GameManager.Hex_Manager.get_hex_at(cell)
	hex.piece = piece_unit;
	piece_unit._piece.hexagon = hex;
	
	
#place piece function
func place_piece(piece_unit, cell: Vector2i) -> void:
	var map = GameManager.Hex_Manager.get_map()
	if map == null:
		return

	# 1. clear hex
	var old_hex = piece_unit._piece.hexagon
	if old_hex != null:
		old_hex.piece = null

	# 2.check the piece at new hex
	var new_hex :Hexagon= GameManager.Hex_Manager.get_hex_at(cell);
	if new_hex == null:
		return

	if new_hex.piece != null:
		print("can not move")
		return

	# 3. update logica
	new_hex.piece = piece_unit
	piece_unit._piece.hexagon = new_hex
	
	# 4. move to new hex
	var local_pos: Vector2 = map.map_to_local(cell)
	piece_unit.global_position = map.to_global(local_pos)

	#var unit: Node2D = piece_to_unit.get(piece_unit.piece, null)
	#if unit:
		#var local_pos: Vector2 = map.map_to_local(cell)
		#unit.global_position = map.to_global(local_pos)
		
#get piece name for random
func get_random_piece_names(count: int) -> Array[String]:
	var names: Array[String] = piece_dict.keys()
	names.shuffle()
	if count < names.size():
		names.resize(count)
	return names
