@tool
class_name WidthPathShaderHandler extends Resource
@export var ClickToUpdate:bool:
	set(x):
		if x:
			update_shader()
@export var shaderid:String="TestWP"
@export var DeleteShaderFile:bool:
	set(x):
		if x:
			print(DirAccess.open("res://addons/FancyXoXo/shaders/").remove("%s.gdshader"%shaderid))
			EditorInterface.get_resource_filesystem().scan()

var shader
@export var shaderQuality:int=100
@export_group("Colors1")
@export var CustomInterEffects1:Array[CustomInterEffect]:
	set(x):
		CustomInterEffects1=x
		for i in x:
			i.inarray=x
			i.owner=self

@export var CustomCombiEffects1:Array[CustomCombiEffect]:
	set(x):
		CustomCombiEffects1=x
		for i in x:
			i.inarray=x
			i.owner=self


@export var CustomAfterEffects1:Array[CustomAfterEffect]:
	set(x):
		CustomAfterEffects1=x
		for i in x:
			i.inarray=x
			i.owner=self

@export_group("Colors2")

@export var CustomInterEffects2:Array[CustomInterEffect]:
	set(x):
		CustomInterEffects2=x
		for i in x:
			i.inarray=x
			i.owner=self

@export var CustomCombiEffects2:Array[CustomCombiEffect]:
	set(x):
		CustomCombiEffects2=x
		for i in x:
			i.inarray=x
			i.owner=self


@export var CustomAfterEffects2:Array[CustomAfterEffect]:
	set(x):
		CustomAfterEffects2=x
		for i in x:
			i.inarray=x
			i.owner=self

@export_group("Between")
@export var CustomInterEffects3:Array[CustomInterEffect]:
	set(x):
		CustomInterEffects3=x
		for i in x:
			i.inarray=x
			i.owner=self

@export var CustomCombiEffects3:Array[CustomCombiEffect]:
	set(x):
		CustomCombiEffects3=x
		for i in x:
			i.inarray=x
			i.owner=self

@export var CustomAfterEffects3:Array[CustomAfterEffect]:
		set(x):
			CustomAfterEffects3=x
			for i in x:
				i.inarray=x
				i.owner=self


func update_shader() -> void:
	if shaderid=="":
		shaderid=XOXOFactory.gen_unique_string(15)
	var reader=GLSLMSReader.new()
	reader.addLabel("##CustomGrad1Effect")
	reader.addLabel("##CustomGrad2Effect")
	reader.addLabel("##CustomGrad3Effect")
	reader.addLabel("##CustomAfter1Effect")
	reader.addLabel("##CustomAfter2Effect")
	reader.addLabel("##CustomAfter3Effect")
	reader.addLabel("##CustomCombi1Effect")
	reader.addLabel("##CustomCombi2Effect")
	reader.addLabel("##CustomCombi3Effect")
	reader.addArraySize(":plen:",shaderQuality+1)
	for effect in CustomInterEffects1:
		reader.addCode("##CustomGrad1Effect",CustomReaders.EffectG1(effect))
	for effect in CustomInterEffects2:
		reader.addCode("##CustomGrad2Effect",CustomReaders.EffectG2(effect))
	for effect in CustomInterEffects3:
		reader.addCode("##CustomGrad3Effect",CustomReaders.EffectG3(effect))
	for effect in CustomAfterEffects1:
		reader.addCode("##CustomAfter1Effect",CustomReaders.AfterEffectG1(effect))
	for effect in CustomAfterEffects2:
		reader.addCode("##CustomAfter2Effect",CustomReaders.AfterEffectG2(effect))
	for effect in CustomAfterEffects3:
		reader.addCode("##CustomAfter3Effect",CustomReaders.AfterEffectG3(effect))
	for effect in CustomCombiEffects1:
		reader.addCode("##CustomCombi1Effect",CustomReaders.CombiEffectG1(effect))
	for effect in CustomCombiEffects2:
		reader.addCode("##CustomCombi2Effect",CustomReaders.CombiEffectG2(effect))
	for effect in CustomCombiEffects3:
		reader.addCode("##CustomCombi3Effect",CustomReaders.CombiEffectG3(effect))
	reader.clean(XOXOFactory.path+"/WPShader.txt",XOXOFactory.path+"/shaders/%s.gdshader"%shaderid)

func get_shader():
	return ResourceLoader.load(XOXOFactory.path+"/shaders/%s.gdshader"%shaderid,"",ResourceLoader.CACHE_MODE_IGNORE)
	
