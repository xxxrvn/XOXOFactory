@tool
class_name RTHueShiftCAE extends CustomAfterEffect
func _init():
	code=":x:=hue_shift(:x:,rep(time,:v0:,:v1:,:v3:,:v4:)*:v2:);"
	TimeFactor=CustomFloat.new(1.)
	RepeatMode=CustomEnumRepeat.new()
	HueFactor=CustomFloat.new(1.)
	Extra1=CustomFloat.new(1.)
	Extra2=CustomFloat.new(1.)
@export var RepeatMode:CustomEnumRepeat
@export var TimeFactor:CustomFloat
@export var HueFactor:CustomFloat
@export var Extra1:CustomFloat
@export var Extra2:CustomFloat
func fill():
	filled=[TimeFactor,RepeatMode,HueFactor,Extra1,Extra2]
