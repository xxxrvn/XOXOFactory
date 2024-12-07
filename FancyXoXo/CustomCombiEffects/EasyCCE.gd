@tool
class_name EasyCCE extends CustomCombiEffect

func _init():
	code=""

@export var HSV:bool
@export_enum("Normal","MaxV","Maxn") var mode:String="Normal"

func gen():
	code=""
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
			code+=":x3:=mix(IRC1,IRC2,:x0:);"
		"MaxV":
			code+=":x3:=maxv(IRC1*:x0:,IRC2*(1.-:x0:));"
		"MaxN":
			code+=":x3:=maxn(IRC1*:x0:,IRC2*(1.-:x0:));"
	if HSV: code+="""
	:x3:=hsv2rgb(:x3:);
	"""
