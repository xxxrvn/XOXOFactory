@tool
class_name SigmoidCIE extends CustomInterEffect
func _init():
	code=":x:=pow(:v0:,:x:-0.5)/(1.+pow(:v0:,:x:-0.5));"
	Base=CustomFloat.new(2.71828182)
	
@export var Base:CustomFloat

func fill():
	filled=[Base]

