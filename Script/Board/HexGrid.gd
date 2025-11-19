extends Node2D
class_name Hex_Grid
@onready var tilemap_layer = $TileMap/TileMapLayer

@export var radius: int = 2
var selected_piece: Piece = null       # current piece



func _ready():
	GameManager.Hex_Manager.register_map(tilemap_layer);
	#generate_hex_map()
	

func _process(delta: float) -> void:
	var cell = GameManager.Hex_Manager.get_mouse_cell(); # output the current mouse position
	#print("mouse cell:", cell);
	var hex = GameManager.Hex_Manager.get_mouse_hex();
	#if hex:
		#print("current hexagon ID:", hex.id);



func generate_hex_map():
	tilemap_layer.clear()
	for q in range(-radius, radius + 1):
		for r in range(-radius, radius + 1):
			if abs(q + r) <= radius:
				tilemap_layer.set_cell(0, Vector2i(q, r), 0)
				
		
