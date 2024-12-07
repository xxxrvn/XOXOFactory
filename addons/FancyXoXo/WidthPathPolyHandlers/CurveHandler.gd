@tool
class_name CurveHandler extends WidthPathPolyHandler
@export var Path:Curve2D
@export var cubic:bool
func gen_point(t: float):
	lf=Path.get_baked_length()
	return Path.sample_baked(t,cubic)
	
