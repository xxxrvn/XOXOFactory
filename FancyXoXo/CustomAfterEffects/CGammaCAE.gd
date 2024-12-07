@tool
class_name CGammaCAE extends CustomAfterEffect
func _init():
	code=":x:=powv(:x:,:v0:);"
	Gamma=CustomFloat.new(1.)
	
@export var Gamma:CustomFloat

func fill():
	filled=[Gamma]

