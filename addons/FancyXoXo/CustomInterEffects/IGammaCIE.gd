@tool
class_name IGammaCIE extends CustomInterEffect
func _init():
	code=":x:=pow(:x:,:v0:);"
	Gamma=CustomFloat.new(1.)
	
@export var Gamma:CustomFloat

func fill():
	filled=[Gamma]
