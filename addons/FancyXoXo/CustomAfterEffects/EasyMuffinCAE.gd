@tool
class_name EasyMuffinCAE extends CustomAfterEffect

func _init():
	code=""
	color=CustomColor.new(Color.BLACK)
	Factor=CustomFloat.new(1.)
	Offset=CustomFloat.new(0.)
@export var color:CustomColor
@export var reverse:bool
@export var HSV:bool
@export_enum("Normal","MaxV","Maxn") var mode:String="Normal"
@export var Factor:CustomFloat
@export var Offset:CustomFloat


func gen():
	code="IRF1=muffin(:v0:,:v1:);"
	if reverse:
		if HSV: code+="""
		IRC2=rgb2hsv(:x:);
		IRC1=rgb2hsv(:v2:);
		"""
		else:code+="""
		IRC2=:x:;
		IRC1=:v2:;
		"""
	else:
		if HSV: code+="""
		IRC1=rgb2hsv(:x:);
		IRC2=rgb2hsv(:v2:);
		"""
		else:code+="""
		IRC1=:x:;
		IRC2=:v2:;
		"""
	match(mode):
		"Normal":
			code+=":x:=mix(IRC1,IRC2,IRF1);"
		"MaxV":
			code+=":x:=maxv(IRC1*IRF1,IRC2*(1.-IRF1));"
		"MaxN":
			code+=":x:=maxn(IRC1*IRF1,IRC2*(1.-IRF1));"
	if HSV: code+="""
	:x:=hsv2rgb(:x:);
	"""
func fill():
	filled=[Factor,Offset,color]
