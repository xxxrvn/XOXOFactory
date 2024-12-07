class_name CustomReaders extends Object
static func Default(input:CustomEffect):
	input.comp()
	var str=input.code
	for i in range(len(input.data)):
		var wtype=input.data[i]
		str=str.replace(":v%d:"%i,wtype)
	return str

static func EffectG1(input:CustomInterEffect)->String:
	var xin=Default(input)
	var code=xin.replace(":x:","fac1")
	return code
static func EffectG2(input:CustomInterEffect)->String:
	var xin=Default(input)
	var code=xin.replace(":x:","fac2")
	return code
static func EffectG3(input:CustomInterEffect)->String:
	var xin=Default(input)
	var code=xin.replace(":x:","online")
	return code
static func AfterEffectG1(input:CustomAfterEffect)->String:
	var xin=Default(input)
	var code=xin.replace(":x:","colora")
	return code
static func AfterEffectG2(input:CustomAfterEffect)->String:
	var xin=Default(input)
	var code=xin.replace(":x:","colorb")
	return code
static func AfterEffectG3(input:CustomAfterEffect)->String:
	var xin=Default(input)
	var code=xin.replace(":x:","color")
	return code

static func CombiEffectG1(input:CustomCombiEffect)->String:
	var xin=Default(input)
	var code=xin.replace(":x0:","fac1")
	code=code.replace(":x3:","colora")
	code=code.replace(":x1:","color1x")
	code=code.replace(":x2:","color2x")
	return code


static func CombiEffectG2(input:CustomCombiEffect)->String:
	var xin=Default(input)
	var code=xin.replace(":x0:","fac2")
	code=code.replace(":x3:","colorb")
	code=code.replace(":x1:","color3x")
	code=code.replace(":x2:","color4x")
	return code

static func CombiEffectG3(input:CustomCombiEffect)->String:
	var xin=Default(input)
	var code=xin.replace(":x0:","online")
	code=code.replace(":x3:","color")
	code=code.replace(":x1:","colora")
	code=code.replace(":x2:","colorb")
	return code

