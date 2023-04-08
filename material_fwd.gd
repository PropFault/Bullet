@tool
extends Node3D
@onready var mesh = get_node("StaticBody3D/MeshInstance3D") as MeshInstance3D
@export var texture: Texture: 
	get:
		mesh = get_node("StaticBody3D/MeshInstance3D") as MeshInstance3D
		var material = mesh.get_surface_override_material(0) as StandardMaterial3D;
		return material.albedo_texture
	set(val):
		_updt_material(val);

			
func _updt_material(new_tex):
	var material = mesh.get_surface_override_material(0) as StandardMaterial3D;
	material.albedo_texture = new_tex;
	mesh.set_surface_override_material(0, material);
