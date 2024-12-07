@tool
class_name FlowCID extends CustomInterEffect
func _init():
	code=":x:=:x:+time*:v0:*pow(:v2:+pow(abs(onlineO),:v3:)*pow(abs(fac),:v4:),:v1:);"
	TimeFactor=CustomFloat.new(1.)
	VarianzA=CustomFloat.new(2.)
	VarianzB=CustomFloat.new(2.)
	VarianzC=CustomFloat.new(2.)
	VarianzD=CustomFloat.new(-0.5)
@export var TimeFactor:CustomFloat
@export var VarianzA:CustomFloat
@export var VarianzB:CustomFloat
@export var VarianzC:CustomFloat
@export var VarianzD:CustomFloat

func fill():
	filled=[TimeFactor,VarianzA,VarianzB,VarianzC,VarianzD]
