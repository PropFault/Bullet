@tool
extends Resource
class_name MapData
var data: Dictionary

func get_block_ids():
	return data.keys()

func get_block(key: Vector3i):
	return data[key];
	
func set_block(key: Vector3i, block):
	data[key] = block
