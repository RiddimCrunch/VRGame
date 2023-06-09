extends Node3D
class_name Chunk

var mesh_instance
var noise
var x
var z
var chunk_size
var should_remove = true

func _init(noise_value, x_value, z_value, chunk_size_value):
	self.noise = noise_value
	self.x = x_value
	self.z = z_value
	self.chunk_size = chunk_size_value

func _ready():
	generate_chunk()
	generate_water()
	
func generate_chunk():
	#Instanciate a new plane mesh
	var plane_mesh = PlaneMesh.new()
	#Asign the size
	plane_mesh.size = Vector2(chunk_size, chunk_size)
	plane_mesh.subdivide_depth = chunk_size * 0.5
	plane_mesh.subdivide_width = chunk_size * 0.5
	
	plane_mesh.material = preload("res://3DGen/terrain.material")
	
	var surface_tool = SurfaceTool.new()
	var data_tool = MeshDataTool.new()
	surface_tool.create_from(plane_mesh, 0)
	var array_plane = surface_tool.commit()
	var _error = data_tool.create_from_surface(array_plane, 0)
	
	for i in range(data_tool.get_vertex_count()):
		var vertex = data_tool.get_vertex(i)
		
		vertex.y = abs(noise.get_noise_3d(vertex.x + x, vertex.y, vertex.z + z)) * 80 + noise.get_noise_3d(vertex.x + x, vertex.y, vertex.z + z) * 125
		data_tool.set_vertex(i, vertex)
		
	# Clear all surfaces
	array_plane.clear_surfaces()
	
	data_tool.commit_to_surface(array_plane)
	surface_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
	surface_tool.create_from(array_plane, 0)
	surface_tool.generate_normals()
	
	mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = surface_tool.commit()
	mesh_instance.create_trimesh_collision()
	mesh_instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	mesh_instance.translate(Vector3(0,0,0))
	add_child(mesh_instance)
	
func generate_water():
	var plane_mesh = PlaneMesh.new()
	plane_mesh.size = Vector2(chunk_size, chunk_size)
	plane_mesh.material = preload("res://3DGen/water.material")
	
	mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = plane_mesh
	mesh_instance.translate(Vector3(0,0,0))
	add_child(mesh_instance)
