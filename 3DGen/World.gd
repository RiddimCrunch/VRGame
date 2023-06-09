extends Node3D

const chunk_size = 32
const chunk_amount = 32

var noise
var chunks = {}
var unready_chunks = {}
@onready var chunk_class = preload("res://3DGen/Chunk.gd") 

func _ready():
	randomize()
	noise = FastNoiseLite.new()
	noise.seed = randi()
	noise.frequency = 0.001
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	
func add_chunk(x, z):
	var key = str(x) + "," + str(z)
	if chunks.has(key) or unready_chunks.has(key):
		return 
	var load_params = [x, z]
	call_deferred("load_chunk", load_params)
	unready_chunks[key] = 1
		
func load_chunk(arr):
	var x = arr[0]
	var z = arr[1]
	
	var chunk = chunk_class.new(noise, x * chunk_size, z * chunk_size, chunk_size)
	chunk.transform.origin = Vector3(x * chunk_size, 0, z * chunk_size)
	
	call_deferred("load_done", chunk)
	
func load_done(chunk):
	add_child(chunk)
	var key = str(chunk.x / chunk_size) + "," + str(chunk.z / chunk_size)
	chunks[key] = chunk
	unready_chunks.erase(key)
	
func get_chunk(x, z):
	var key = str(x) + "," + str(z)
	if chunks.has(key):
		return chunks.get(key)
	return null

func _process(_delta):
	update_chunks()
	clean_up_chunks()
	reset_chunks()
	
func update_chunks():
	var player_translation = $Player.global_transform.origin
	var p_x = player_translation.x / chunk_size
	var p_z = player_translation.z / chunk_size
	
	for x in range(p_x - chunk_amount * 0.5, p_x + chunk_amount * 0.5):
		for z in range(p_z - chunk_amount * 0.5, p_z + chunk_amount * 0.5):
			add_chunk(x, z)
			var chunk = get_chunk(x, z)
			if chunk != null:
				chunk.should_remove = false
			
func clean_up_chunks():
	for key in chunks:
		var chunk = chunks[key]
		if chunk.should_remove:
			chunk.queue_free()
			chunks.erase(key)
	
func reset_chunks():
	for key in chunks:
		chunks[key].should_remove = true
