@tool
class_name CustomInt extends CustomVar
@export_enum("Value") var val:String:
	set(x):
		val=x
		if x!="Custom":
			Custom=asstr()
@export var Value:int=0.:
	set(x):
		Value=x
		if val!="Custom":
			Custom=asstr()
@export var Custom:String=""
func asstr()->String:
	if val=="Value":return "%d"%Value
	if val=="Custom":return Custom
	return "0"
func _init(a:int=0):
	val="Value"
	Value=a
