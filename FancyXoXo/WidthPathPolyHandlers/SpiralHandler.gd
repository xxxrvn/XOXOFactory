@tool
class_name SpiralHandler extends WidthPathPolyHandler

@export var standartX:float=40
@export var standartY:float=40
@export var variantX:float=50
@export var variantY:float=50
@export var pseudoX:float=1
@export var pseudoY:float=1
@export var powerX:float=1
@export var powerY:float=1
@export var adjustX:float=0
@export var adjustY:float=0
@export var length:float=1.5:
	set(x):
		length=x
		lf=x

@export var logarythmic:bool=true

	
	
func gen_point(tn:float)->Vector2:
	var ds=Vector2(1,0).rotated(tn*PI*2)
	var psx=1./pseudoX
	var psy=1./pseudoY
	var dm=Vector2(abs(ds.x)**psx*sign(ds.x),abs(ds.y)**psy*sign(ds.y))
	var tx=tn**powerX
	var ty=tn**powerY
	if !logarythmic:
		tx=exp(tn)**powerX
		ty=exp(tn)**powerY
	tx/=dm.length()**adjustX
	ty/=dm.length()**adjustY
	var res=Vector2(dm.x*(standartX+variantX*tx),dm.y*(standartY+variantY*ty))
	return res


