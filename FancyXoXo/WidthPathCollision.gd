@tool
class_name WidthPathCollision extends CollisionPolygon2D
var time:float=0
var shaderps=[]
var shaderns=[]

@export var clickToUpdate:bool:
	set(x):
		if x:
			polygon=PolyHandler.get_polygon_points(polygonQuality)
@export var PolyHandler:WidthPathPolyHandler
@export var startpoint_is_circle:bool=true:
	set(x):
		startpoint_is_circle=x
		PolyHandler.startpoint_is_circle=x

@export var endpoint_is_circle:bool=true:
	set(x):
		endpoint_is_circle=x
		PolyHandler.endpoint_is_circle=x
@export var width: float = 20.0:
	set(x):
		width=x
		PolyHandler.width=x
@export var polygonQuality: int = 32


func _init():
	if Engine.is_editor_hint():
		material=ShaderMaterial.new()
		PolyHandler=PolyBezierHandler.new()
		PolyHandler.Points.push_back(Vector2(0,0))
		PolyHandler.Points.push_back(Vector2(100,100))
		
		
func _process(delta):
	material.set_shader_parameter("time",time)
	time+=delta	
	
func dynamic():
		polygon=PolyHandler.get_polygon_points(polygonQuality)
