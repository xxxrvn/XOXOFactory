@tool
class_name CustomEffect extends Resource
var filled:Array[CustomVar]=[]
var data:Array[String]=[]
var code:String=""
func gen():
	pass
func fill():
	pass
func comp():
	gen()
	fill()
	data=[]
	for x in filled:
		data.push_back(x.asstr())
