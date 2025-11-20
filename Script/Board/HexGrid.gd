extends Node2D
class_name Hex_Grid
@onready var tilemap_layer = $TileMap/TileMapLayer

@export var radius: int = 2
var selected_piece: Piece = null       # current piece

var timer = 0;

func _ready():
	
	GameManager.Hex_Manager.register_map(tilemap_layer);
	#generate_hex_map()
	await get_tree().create_timer(0.5).timeout
	var test_piece = GameManager.Piece_Manager.get_piece("Test_Piece");
	GameManager.Piece_Manager.spawn_piece(test_piece, Vector2i(0, 1)); #specify the cell
	#GameManager.Piece_Manager.
	var test_piece2 = GameManager.Piece_Manager.get_piece("Test_Piece");
	GameManager.Piece_Manager.spawn_piece(test_piece2, Vector2i(0, 2)); #specify the cell

func _process(delta: float) -> void:
	var cell = GameManager.Hex_Manager.get_mouse_cell(); # output the current mouse position
	#print("mouse cell:", cell);
	var hex = GameManager.Hex_Manager.get_mouse_hex();
	
	
	
	timer += delta
	if hex and timer >= 1:
		print("current hexagon ID:", hex.id);
		timer = 0;


func generate_hex_map():
	tilemap_layer.clear()
	for q in range(-radius, radius + 1):
		for r in range(-radius, radius + 1):
			if abs(q + r) <= radius:
				tilemap_layer.set_cell(0, Vector2i(q, r), 0)
				
		
