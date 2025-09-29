extends Node2D


func _process(_delta: float) -> void:
	var mousePos : Vector2i = get_global_mouse_position() / 16;
	if(mousePos.x < 0 && mousePos.y < 0):
		return;
	var mouseGlobalPos = mousePos * 16;
	position = mouseGlobalPos;
	
