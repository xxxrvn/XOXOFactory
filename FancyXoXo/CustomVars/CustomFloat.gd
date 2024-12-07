@tool
class_name CustomFloat extends CustomVar
@export_enum("Value","Time","Line Point","Line Distance","Custom","CRF1","CRF2","CRF3","CRF4","CUF1","CUF2","CUF3","CUF4") var val:String:
	set(x):
		val=x
		if x!="Custom":
			Custom=asstr()

@export var Value:float=0.:
	set(x):
		Value=x
		if val!="Custom":
			Custom=asstr()
@export var Custom:String=""
func asstr()->String:
	if val=="Value":return "%f"%Value
	if val=="Time":return "time"
	if val=="Line Point":return "onlineO/len"
	if val=="Line Distance":return "abs(fac)"
	if val=="Custom":return Custom
	
	return val
func _init(a:float=0.):
	val="Value"
	Value=a
