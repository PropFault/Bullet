extends Node3D
class_name MapGenerator

@export var start: Node3D
@export var end: Node3D
@export var seed: int = 0
@export var out: MapData
@export var node_palette: Array[Script]
@export var node_min_dimensions: int 
@export var node_min_distance: int = 10
@export var node_max_distance: int = 40
@export var start_node_idx = 0;
@export var end_node_idx = 1;
@export var max_nodes = 10;
var root: MapGeneratorNode
var goal: MapGeneratorNode

var cursor: MapGeneratorNode
func generate():
	var rng = RandomNumberGenerator.new()
	rng.seed = seed
	
	#generate root
	root = Node3D.new()
	root.name="root"
	root.global_position = start.global_position
	root.set_script(node_palette[start_node_idx]);
	
	self.add_child(root);
	
	cursor = root
	
	#generate some nodes
	
	var num_nodes = rng.randi_range(0, max_nodes);
	for i in num_nodes:
		var node_kind = rng.randi_range(0, node_palette.size())
		var node_pos = Vector3i(cursor.position) + Vector3i(rng.randi_range(node_min_distance, node_max_distance), rng.randi_range(node_min_distance, node_max_distance), rng.randi_range(node_min_distance, node_max_distance))
		var node_dimensions = Vector3i()
	
	#generate end
	goal = Node3D.new()
	goal.name = "goal"
	goal.global_position = end.global_position
	goal.set_script(node_palette[end_node_idx]);
	
	
