@tool
class_name EasyMuffinCCE extends CustomCombiEffect

func _init():
	code=""
	Factor=CustomFloat.new(1.)
	Offset=CustomFloat.new(0.)
@export var HSV:bool
@export_enum("Normal","MaxV","Maxn") var mode:String="Normal"
@export var Factor:CustomFloat
@export var Offset:CustomFloat


func gen():
	code="IRF1=muffin(:v0:,:x0:-(:v1:));"
	if HSV: code+="""
	IRC1=rgb2hsv(:x1:);
	IRC2=rgb2hsv(:x2:);
	"""
	else:code+="""
	IRC1=:x1:;
	IRC2=:x2:;
	"""
	match(mode):
		"Normal":
			code+=":x3:=mix(IRC1,IRC2,IRF1);"
		"MaxV":
			code+=":x3:=maxv(IRC1*IRF1,IRC2*(1.-IRF1));"
		"MaxN":
			code+=":x3:=maxn(IRC1*IRF1,IRC2*(1.-IRF1));"
	if HSV: code+="""
	:x3:=hsv2rgb(:x3:);
	"""

func fill():
	filled=[Factor,Offset]
