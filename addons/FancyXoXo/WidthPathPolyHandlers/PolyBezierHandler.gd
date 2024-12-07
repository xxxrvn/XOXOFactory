@tool
class_name  PolyBezierHandler extends WidthPathPolyHandler



@export var Points:PackedVector2Array



func gen_point(t: float):
	return polybeziersub(Points,t)[0]
	
func polybeziersub(points:PackedVector2Array,t:float):
	var npoints:=PackedVector2Array()
	for i in range(len(points)-1):
		npoints.push_back(points[i].lerp(points[i+1],t))
	if len(npoints)<2:
		return npoints
	return polybeziersub(npoints,t)
