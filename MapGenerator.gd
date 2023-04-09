@tool
extends MapData
class_name MapGenerator
@export var palette: BlockPalette
var noise: Noise
@export var from : Vector3i
@export var to : Vector3i
@export var _noise: Noise:
	set(value):
		noise = value;
		generate(from, to)
	get:
		return noise
@export var sample_step = 0.1
@export var do_generate = false:
	set(value):
		generate(from, to)
	get:
		return false;

func generate(from: Vector3i, to: Vector3i):
	print("trying to generate")
	var x = from.x;
	var y = from.y;
	var z = from.z;
	
	while(x < to.x):
		y = from.y
		while(y < to.y):
			z = from.z;
			while(z < to.z):
				var xf = x * sample_step
				var yf = y * sample_step
				var zf = z * sample_step
				
				print(x, '!', y, '!', z)
				
				var val = noise.get_noise_3d(xf, yf, zf)
				print(val)
				var palette_steps = palette.data.size()
				var block = roundi(val * palette_steps) - 1
				print(block)
				if block >= 0:
					self.set_block(Vector3i(x,y,z), block);
				z += 1;
			y += 1;
		x += 1;
	
