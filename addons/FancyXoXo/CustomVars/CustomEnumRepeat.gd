@tool
class_name CustomEnumRepeat extends CustomVar

@export_enum("None","Triwave","Sinus","Circwave","Quadwave","Modulo","Bouncewave","SinusBounce","Squircwave","Squircbounce","Parasaw") var RepeatMode:int=0
func asstr()->String:
	return "%d"%RepeatMode
	
