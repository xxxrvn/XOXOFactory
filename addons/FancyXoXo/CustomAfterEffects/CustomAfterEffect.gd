@tool
class_name CustomAfterEffect extends CustomEffect
var inarray
var owner
@export var CreateCustom:bool:
	set(x):
		if x:
			gen()
			fill()
			inarray.push_back(CustomCodeCAE.new(code,filled))
			owner.notify_property_list_changed()
