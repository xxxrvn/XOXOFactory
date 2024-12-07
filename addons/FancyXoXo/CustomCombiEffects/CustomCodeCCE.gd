@tool
class_name  CustomCodeCCE extends CustomCombiEffect
func _init(c=":x3:=mix(:x1:,:x2:,:x0:);",args:Array[CustomVar]=[]):
	code=c
	myCode=c
	Args=args.duplicate()
@export_multiline var myCode:String=":x3:=mix(:x1:,:x2:,:x0:);":
	set(x):
		myCode=x
		code=x

@export var Args:Array[CustomVar]=[]
func fill():
	filled=Args.duplicate()
