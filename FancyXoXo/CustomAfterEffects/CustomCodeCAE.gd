@tool
class_name CustomCodeCAE extends CustomAfterEffect
func _init(c=":x:=:x:;",args:Array[CustomVar]=[]):
	code=c
	myCode=c
	Args=args.duplicate()
@export_multiline var myCode:String=":x:=:x:;":
	set(x):
		myCode=x
		code=x

@export var Args:Array[CustomVar]=[]
func fill():
	filled=Args.duplicate()
