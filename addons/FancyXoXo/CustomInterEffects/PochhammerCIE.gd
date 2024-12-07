@tool
class_name PochhammerCIE extends CustomInterEffect
func _init():
	code=":x:=pochhammer(:x:,:v0:);"
	Pochhammer=CustomInt.new(1)
	
@export var Pochhammer:CustomInt

func fill():
	filled=[Pochhammer]

