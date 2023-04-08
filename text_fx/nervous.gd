@tool
extends RichTextEffect
var bbcode = "uwu"


func _process_custom_fx(char_fx):
	if(randf_range(0.0, 1.0) > 0.9):
		char_fx.glyph_index += 1;
	return true
