@tool
class_name CustomColor extends CustomVar
@export_enum("Value","Custom","CRC1","CRC2","CRC3","CRC4","CUC1","CUC2","CUC3","CUC4") var val:String:
	set(x):
		val=x
		if x!="Custom":
			Custom=asstr()

@export var Value:Color=Color.BLACK:
	set(x):
		Value=x
		if val!="Custom":
			Custom=asstr()
@export var Custom:String=""
func asstr()->String:
	if val=="Value":return "vec4(%f,%f,%f,%f)"%[Value.r,Value.g,Value.b,Value.a]
	if val=="Custom":return Custom
	return val
func _init(a:Color=Color.BLACK):
	val="Value"
	Value=a
