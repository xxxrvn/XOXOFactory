@tool
class_name SmootherCIE extends CustomInterEffect
func _init():
	code=":x:=smoother(:x:,:v0:)"
	Repeats=CustomInt.new(1.)
	
@export var Repeats:CustomInt


func fill():
	filled=[Repeats]

