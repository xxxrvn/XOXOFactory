@tool
class_name WidthPathDrawable extends Polygon2D
var time:float=0
var shaderps=[]
var shaderns=[]

@export var clickToUpdate:bool:
	set(x):
		if x:
			polygon=PolyHandler.get_polygon_points(polygonQuality)
			update_shader()
@export var PolyHandler:WidthPathPolyHandler
@export var ShaderHandler:WidthPathShaderHandler
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
@export var shaderQuality:int=100:
	set(x):
		shaderQuality=x
		ShaderHandler.shaderQuality=x
	

@export var alphaIgnore:bool

@export_group("Colors1")
@export var inner1 :Color
@export var outer1 :Color
@export var width_factor1:float=1.

@export var GradientMode1:bool
@export_group("Colors2")
@export var inner2 :Color
@export var outer2 :Color
@export var width_factor2:float=1.

@export var GradientMode2:bool

@export_group("Between")

			
@export var GradientMode3:bool

@export var adjust:float=0.

@export_group("Ountline")
@export var OutlineColor:Color
@export var OutlineSize:float

func _init():
	if Engine.is_editor_hint():
		texture=GradientTexture2D.new()
		texture.gradient=Gradient.new()
		material=ShaderMaterial.new()
		ShaderHandler=WidthPathShaderHandler.new()
		ShaderHandler.CustomCombiEffects1.push_back(EasyCCE.new())
		ShaderHandler.CustomCombiEffects2.push_back(EasyCCE.new())
		ShaderHandler.CustomCombiEffects3.push_back(EasyCCE.new())
		inner1=Color.REBECCA_PURPLE
		inner2=Color.AQUAMARINE
		outer1=Color.DARK_MAGENTA
		outer2=Color.DARK_GREEN
		OutlineSize=2.
		PolyHandler=PolyBezierHandler.new()
		PolyHandler.Points.push_back(Vector2(0,0))
		PolyHandler.Points.push_back(Vector2(100,100))

		update_shader()
		
func _process(delta):
	material.set_shader_parameter("time",time)
	time+=delta	
	
func dynamic():
		polygon=PolyHandler.get_polygon_points(polygonQuality)
		material.set_shader_parameter("positions",PolyHandler.get_shader_points(shaderQuality))
		material.set_shader_parameter("norms",PolyHandler.get_shader_norms(shaderQuality))
func update_shader() -> void:
	if(ShaderHandler!=null):
		ShaderHandler.update_shader()
		shaderps=PolyHandler.get_shader_points(shaderQuality)
		shaderns=PolyHandler.get_shader_norms(shaderQuality)
		material.shader=ShaderHandler.get_shader()
		material.set_shader_parameter("positions",shaderps)
		material.set_shader_parameter("norms",shaderns)
		material.set_shader_parameter("color1",inner1)
		material.set_shader_parameter("color2",outer1)
		material.set_shader_parameter("color3",inner2)
		material.set_shader_parameter("color4",outer2)
		material.set_shader_parameter("quad1",!startpoint_is_circle)
		material.set_shader_parameter("quad2",!endpoint_is_circle)
		material.set_shader_parameter("wf1",width_factor1)
		material.set_shader_parameter("wf2",width_factor2)
		material.set_shader_parameter("lenadjust",adjust)

		material.set_shader_parameter("grad1b",GradientMode1)
		material.set_shader_parameter("grad2b",GradientMode2)
		material.set_shader_parameter("grad3b",GradientMode3)
		material.set_shader_parameter("outlinecolor",OutlineColor)
		material.set_shader_parameter("outlinewidth",OutlineSize)
		material.set_shader_parameter("width",width)
		material.set_shader_parameter("alphaignore",alphaIgnore)
