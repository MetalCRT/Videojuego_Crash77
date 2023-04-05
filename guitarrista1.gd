extends CharacterBody2D

# snap mouse position to a multiple of the cell size
var tile_position = (mouse_position/tilemap_cell_size.x).floor()*tilemap_cell_size.x
# offset with half the cell size
var player_position = tile_position + tilemap_cell_size/2

