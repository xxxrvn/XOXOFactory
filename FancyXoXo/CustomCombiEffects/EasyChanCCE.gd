@tool
class_name EasyChanCCE extends CustomCombiEffect

func _init():
	code=""

@export var HSV:bool
@export_enum("Normal","MaxV","Maxn") var mode:String="Normal"
@export_enum("Mix","First","Second") var RedHue:String="Mix"
@export_enum("Mix","First","Second") var GreenSat:String="Mix"
@export_enum("Mix","First","Second") var BlueVal:String="Mix"
@export_enum("Mix","First","Second") var Alpha:String="Mix"
func addMix(para:String,how:String)->String:
	var ostr=""
	match how:
		"Mix":
			match(mode):
				"Normal":
					ostr=":x3:.{0}=mix(IRC1.{0},IRC2.{0},:x0:);".format([para])
				"MaxV":
					ostr=":x3:.{0}=maxv(IRC1.{0}*:x0:,IRC2.{0}*(1.-:x0:));".format([para])
				"MaxN":
					ostr=":x3:.{0}=maxn(IRC1.{0}*:x0:,IRC2.{0}*(1.-:x0:));".format([para])
		"First":
			ostr=":x3:.{0}=IRC1.{0};".format([para])
		"Second":
			ostr=":x3:.{0}=IRC2.{0};".format([para])
			
	return ostr
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
	code+=addMix("x",RedHue)
	code+=addMix("y",GreenSat)
	code+=addMix("z",BlueVal)
	code+=addMix("w",Alpha)
	if HSV: code+="""
	:x3:=hsv2rgb(:x3:);
	"""
