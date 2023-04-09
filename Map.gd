@tool
extends Node3D
class_name Map
var data: MapData
@export var _data: MapData : 
	set(value):
		data = value;
		update_map();
	get:
		return data;
@export var palette: BlockPalette
@export var update = false:
	set(value):
		update_map()

func update_map():
	#clear map
	print("WUH")
	for n in self.get_children():
		self.remove_child(n)
		n.queue_free()
	#read and generate
	for k in data.get_block_ids():
		print(k)
		var block = data.get_block(k);
		if not block == null:
			var instance = palette.data[block].instantiate() as Node3D;
			instance.position = k;
			self.add_child(instance)
