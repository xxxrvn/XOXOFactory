@tool
class_name  PolyFactorBezierHandler extends WidthPathPolyHandler



@export var Points:Array[FactorPoint]



func flerp(a:FactorPoint,b:FactorPoint,t:float):
	var c:=FactorPoint.new()
	c.p=(a.p*a.f*(1.-t)+b.p*b.f*(t))/(a.f*(1.-t)+b.f*(t))
	c.f=(a.f*(1.-t)+b.f*(t))
	return c

func gen_point(t: float):
	return polybeziersub(Points,t)[0].p
	
func polybeziersub(points:Array[FactorPoint],t:float):
	var npoints:Array[FactorPoint]=[]
	for i in range(len(points)-1):
		npoints.push_back(flerp(points[i],points[i+1],t))
	if len(npoints)<2:
		return npoints
	return polybeziersub(npoints,t)
