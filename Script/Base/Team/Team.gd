
extends Node2D
class_name Team

var queue: Array[Piece] = []

func add_piece(piece: Piece) -> void:
	queue.append(piece)

func draw_piece() -> Piece:
	if queue.is_empty():
		return null
	return queue.pop_front()
