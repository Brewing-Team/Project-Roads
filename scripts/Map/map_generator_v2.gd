extends Node3D

var terrain_mesh_instance: MeshInstance3D;
var terrain_mesh: PlaneMesh

@export var terrain_material: ShaderMaterial
@export var heightmap: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	terrain_mesh_instance = MeshInstance3D.new()
	terrain_mesh = PlaneMesh.new()
	terrain_mesh.size = Vector2(1024, 1024)
	terrain_mesh.subdivide_depth = 128
	terrain_mesh.subdivide_width = 128
	
	terrain_mesh_instance.mesh = terrain_mesh
	
	terrain_material.set_shader_parameter("heightmap", heightmap)
	terrain_material.set_shader_parameter("height_scale", 100)
	
	var heightmap_normal = heightmap.duplicate(true)
	heightmap_normal.as_normal_map = true
	
	terrain_material.set_shader_parameter("heightmap_normals", heightmap_normal)
	
	terrain_mesh_instance.material_override = terrain_material
	
	add_child(terrain_mesh_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
