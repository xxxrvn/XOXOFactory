@tool
class_name TNormCIE extends CustomInterEffect
func _init():
	code=":x:=:x:*dot(vec2(:v1:*sin(time*:v0:),:v2:*cos(time*:v0:)),:v3:);"
	TimeFactor=CustomFloat.new(1.)
	VarianzA=CustomFloat.new(2.)
	VarianzB=CustomFloat.new(2.)
	Direction=CustomNormVec2.new(1,0)
	
@export var TimeFactor:CustomFloat
@export var VarianzA:CustomFloat
@export var VarianzB:CustomFloat
@export var Direction:CustomNormVec2

func fill():
	filled=[TimeFactor,VarianzA,VarianzB,Direction]
