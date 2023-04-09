extends MapGeneratorNode
class_name MapGeneratorRoomNode

@export var dimensions: Vector3i;
@export var wall_thickness: int = 1;
@export var block_mat_outside: int = 0;
@export var block_mat_inside: int = 0;

func init_values(rng: RandomNumberGenerator):
	pass

func get_data():
	var tl = Vector3i(self.position) - dimensions / 2;
	var br = Vector3i(self.position) + dimensions / 2;
	return BlockRasterizer.draw_rect_hollow(tl, br, wall_thickness,block_mat_outside, block_mat_inside);

func get_aabb():
	return AABB(Vector3i(self.position) - dimensions / 2, dimensions / 2);
