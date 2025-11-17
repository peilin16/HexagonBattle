extends Resource
class_name Hexagon
#hexagon information vessel
@export var position: Vector2i
@export var piece: Piece
@export var available: bool = true
@export var id: int
#  TileMap information
@export var tile_source_id: int = -1
@export var tile_atlas_coords: Vector2i = Vector2i.ZERO
@export var tile_alt_id: int = 0

# terrain str
@export var terrain_type: String = ""
