@tool
class_name RepeatCID extends CustomInterEffect
func _init():
	code=":x:=rep(:x:,:v1:,:v0:,:v2:,:v3:);"
	Repeats=CustomFloat.new(1.)
	Extra1=CustomFloat.new(1.)
	Extra2=CustomFloat.new(1.)
@export var RepeatMode:CustomEnumRepeat
@export var Repeats:CustomFloat
@export var Extra1:CustomFloat
@export var Extra2:CustomFloat

func fill():
	filled=[RepeatMode,Repeats,Extra1,Extra2]
