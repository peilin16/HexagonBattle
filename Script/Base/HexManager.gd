extends Node2D
class_name Hex_Manger

var tileMapLayer:TileMapLayer;
#crucial get board information 
var hex_dict: Dictionary = {}

func _ready() -> void:
	await get_tree().process_frame

func register_map(t) -> void:
	tileMapLayer = t
	print("Map registered:", tileMapLayer);
	_init_hexes_from_tilemap(50)  # preload 50
	
	
func get_map()->TileMapLayer:
	return tileMapLayer;

func _init_hexes_from_tilemap(max_count: int) -> void:
	if tileMapLayer == null:
		return

	hex_dict.clear()
	var count := 0

	# Traversal all TileMap was be paint
	for cell: Vector2i in tileMapLayer.get_used_cells():
		var hex := Hexagon.new()
		hex.position = cell
		hex.id = count

		# read TileMapLayer tile information
		hex.tile_source_id = tileMapLayer.get_cell_source_id(cell)
		hex.tile_atlas_coords = tileMapLayer.get_cell_atlas_coords(cell)
		hex.tile_alt_id = tileMapLayer.get_cell_alternative_tile(cell)
		

		var tile_data = tileMapLayer.get_cell_tile_data(cell)
		if tile_data and tile_data.has_custom_data("terrain_type"):
			hex.terrain_type = tile_data.get_custom_data("terrain_type")

		hex_dict[cell] = hex

		count += 1
		if count >= max_count:
			break


# get Hexagon by vector2i
func get_hex_at(cell: Vector2i) -> Hexagon:
	if hex_dict.has(cell):
		return hex_dict[cell]
	return null  

# get Hexagon by mouse
func get_mouse_hex() -> Hexagon:
	var cell := get_mouse_cell()
	return get_hex_at(cell)


#get mouse vector2i	
func get_mouse_cell() -> Vector2i: 
	var mouse_global: Vector2 = get_global_mouse_position();
	var mouse_local: Vector2 = tileMapLayer.to_local(mouse_global)
	var cell: Vector2i = tileMapLayer.local_to_map(mouse_local)
	return cell
