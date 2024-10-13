shader_type spatial;

uniform sampler2D heightmap;
uniform sampler2D heightmap_normals;
uniform float height_scale = 1.0;

varying vec2 tex_position;

void vertex() {
	tex_position = VERTEX.xz / 2.0 + 0.5;
	
	float height = texture(heightmap, tex_position).x;
	VERTEX.y += height * height_scale;
}

void fragment() {
	ALBEDO = texture(heightmap_normals, tex_position).xyz;
	NORMAL_MAP = texture(heightmap_normals, tex_position).xyz;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
