@tool
class_name XOXOFactory extends EditorPlugin
static var path=""

static func gen_unique_string(length: int) -> String:
	var ascii_letters_and_digits = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	var result = ""
	for i in range(length):
		result += ascii_letters_and_digits[randi() % ascii_letters_and_digits.length()]
	return result


func _enter_tree():
	path=self.get_script().resource_path.get_base_dir() 
