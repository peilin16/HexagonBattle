extends Node
class_name Operation

@export var hex_manager: Hex_Manger
@export var piece_manager: Piece_Manger

var selected_piece = null

func _ready() -> void:
	await get_tree().create_timer(0.3).timeout
	hex_manager = GameManager.Hex_Manager
	piece_manager = GameManager.Piece_Manager
	pass


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_on_left_click()


func _on_left_click() -> void:
	var hex := hex_manager.get_mouse_hex()
	if hex == null:
		return

	if selected_piece == null:
		if hex.piece != null:
			selected_piece = hex.piece
			print("choosen piece:", selected_piece.name)
		return

	if hex.piece == null:
		piece_manager.place_piece(selected_piece, hex.position)
		selected_piece = null
	else:
		selected_piece = hex.piece
