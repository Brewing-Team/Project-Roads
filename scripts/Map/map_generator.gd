extends Node

@onready var heightmap:TextureRect = $HeightMap

var terrain: Terrain3D

var offset = 0.0

func _ready():
	# Create a terrain
	terrain = Terrain3D.new()
	terrain.set_collision_enabled(false)
	terrain.storage = Terrain3DStorage.new()
	terrain.assets = Terrain3DAssets.new()
	terrain.name = "Terrain3D"
	add_child(terrain, true)
	terrain.material.world_background = Terrain3DMaterial.NONE
	
	# Enable collision. Enable the first if you wish to see it with Debug/Visible Collision Shapes
	terrain.set_show_debug_collision(true)
	terrain.set_collision_enabled(true)
	
	await heightmap.texture.changed
	terrain.storage.import_images([heightmap.texture.get_image(), null, null], Vector3(-1024, 0, -1024), 0.0, 300.0)
	
func _process(delta: float) -> void:
	#terrain.storage.get_maps(Terrain3DStorage.TYPE_HEIGHT)[0] = heightmap.texture.get_image()
	terrain.storage.force_update_maps(Terrain3DStorage.TYPE_HEIGHT)
