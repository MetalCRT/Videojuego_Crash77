shader_type canvas_item;

void fragment() {
	COLOR = textureLod(TEXTURE, UV, 100000);
}
