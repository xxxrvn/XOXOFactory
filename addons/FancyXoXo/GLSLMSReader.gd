@tool
class_name GLSLMSReader extends Object
var sizes={}
var codes={}
func addLabel(label:String):
	codes[label]=""

func addArraySize(arrname:String,size:int):
	sizes[arrname]=size
	
func addCode(label:String,code:String):
	codes[label]+="\n\n"+code+"\n\n"
func clean(pathin,pathout):
	var filein=FileAccess.open(pathin, FileAccess.READ)
	var fileout=FileAccess.open(pathout, FileAccess.WRITE)
	while filein.get_position() < filein.get_length():
		var line=filein.get_line()
		if line.begins_with("##"):
			fileout.store_string(codes[line])
		elif line.begins_with("#:"):
			var nline=line.replace("#:","")
			for ix in sizes:
				nline=nline.replace(ix,"%d"%sizes[ix])
			fileout.store_line(nline)
		else:
			fileout.store_line(line)
	EditorInterface.get_resource_filesystem().scan()
	EditorInterface.get_resource_filesystem().update_file(pathout)
			
