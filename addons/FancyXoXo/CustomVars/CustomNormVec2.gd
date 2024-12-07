@tool
class_name CustomNormVec2 extends CustomVar
var nocalc:bool=false
@export_enum("Value","Norm","NormOrtho","Custom") var val:String:
	set(x):
		val=x
		if x!="Custom":
			Custom=asstr()
@export_range(-PI*2,PI*2) var Direction:float=0.:
	set(x):
		nocalc=true
		Direction=x
		Vector=Vector2.from_angle(Direction)
		nocalc=false

@export var Vector:Vector2=Vector2(1,0):
	set(x):
		Vector=x
		if !nocalc:
			Direction=Vector.angle()
			if recalc:
				Vector=Vector.normalized()
@export var recalc:bool:
	set(x):
		recalc=x
		if x:
			Vector=Vector.normalized()
			Direction=Vector.angle()
@export var Custom:String=""
func asstr()->String:
	if val=="Value":return "vec2(%f,%f)"%[Vector.x,Vector.y]
	if val=="Norm":return "norm"
	if val=="NormOrtho":return "onorm"
	if val=="Custom":return Custom
	return "vec2(1.,0.)"
func _init(a:float=0.,b:float=0.):
	val="Value"
	Vector=Vector2(a,b);
