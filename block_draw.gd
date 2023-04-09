class_name BlockRasterizer

static func draw_rect(top_left: Vector3i, bottom_right: Vector3i, material):
	var data = {}
	for x in range(top_left.x, bottom_right.x):
		for y in range(top_left.y, bottom_right.y):
			for z in range(top_left.z, bottom_right.z):
				data[Vector3i(x,y,z)] = material
	return data

static func subtract(lhs: Dictionary, rhs: Dictionary):
	for k in rhs.keys():
		lhs.erase(k)
		
static func change_mat_in_area(target: Dictionary, top_left: Vector3i, bottom_right: Vector3i, new_mat):
	for k in target.keys():
		if(k.x > top_left.x and k.x < bottom_right.x and k.y > top_left.y and k.y < bottom_right.y and k.z > top_left.z and k.z < bottom_right.z):
			target[k] = new_mat
			
static func reduce_vector(target: Vector3i, step):
	var abs = target.abs();
	return Vector3i(sign(target.x) * (abs.x - step), sign(target.y) * (abs.y - step), sign(target.z) * (abs.z - step))

static func draw_rect_hollow(top_left: Vector3i, bottom_right: Vector3i, wall_thickness, material_outside, material_inside):
	var rectOut = draw_rect(top_left, bottom_right, material_outside)
	var inTl = reduce_vector(top_left, wall_thickness)
	var inBr = reduce_vector(bottom_right, wall_thickness)
	var rectIn = draw_rect(inTl, inBr,material_inside);
	
	var subRect = subtract(rectOut, rectIn);
	if wall_thickness > 1:
		change_mat_in_area(subRect, reduce_vector(inTl, -1), reduce_vector(inBr, -1), material_inside);
	return subRect;
