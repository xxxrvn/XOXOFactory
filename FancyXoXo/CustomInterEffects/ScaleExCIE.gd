@tool
class_name ScaleExCIE extends CustomInterEffect
func _init():
	code=":x:=:x:*pow(:v0:,:x:);"
	Base=CustomFloat.new(2.)
	
@export var Base:CustomFloat

func fill():
	filled=[Base]
