@tool
class_name WidthPathPolyHandler extends Resource

@export var startpoint_is_circle:bool=true
@export var endpoint_is_circle:bool=true
@export var width: float = 20.0
var lf:float=1
func dynamic():
	update_polygons()
func update_polygons():
	pass
	
func _ready() -> void:
	if Engine.is_editor_hint():
		update_polygons()

func add_ending(norm,pos,rad) -> PackedVector2Array:
	var points=8
	var epoints:=PackedVector2Array()
	for i in range(points + 1):
		var angle= deg_to_rad(5 + float(i) * (170) / points+90)
		epoints.push_back(pos + Vector2(cos(angle), sin(angle)).rotated(norm.angle()) * rad)
	return epoints

func get_polygon_points(q:int) -> PackedVector2Array:
	var half_width := width / 2
	var inner_circle := gen_points(q,-half_width)
	var outer_circle := gen_points(q,half_width)
	var ending0:=add_ending(gen_norm(0),gen_point(0),half_width)
	var ending1:=add_ending(-gen_norm(lf),gen_point(lf),half_width)

	inner_circle.reverse()
	
	var points := PackedVector2Array()
	if startpoint_is_circle:
		points.append_array(ending0)
	points.append_array(outer_circle)
	if endpoint_is_circle:
		points.append_array(ending1)
	points.append_array(inner_circle)
	return points

func get_shader_points(q:int) -> PackedVector2Array:
	var points_arc := PackedVector2Array()
	for i in range(q + 1):
		var xpoint=gen_point(float(i)/q*lf)
		points_arc.push_back(xpoint)
	return points_arc
func get_shader_norms(q:int) -> PackedVector2Array:
	var points_arc := PackedVector2Array()
	for i in range(q + 1):
		var xpoint=gen_norm(float(i)/q*lf).orthogonal()
		points_arc.push_back(xpoint)
	return points_arc



func gen_points(q:int,offset:float) -> PackedVector2Array:
	var nb_points := 16
	var points_arc := PackedVector2Array()
	for i in range(q + 1):

		var xpoint=gen_point(float(i)/q*lf)
		var xnorm=gen_norm(float(i)/q*lf)
		points_arc.push_back(xpoint+xnorm.orthogonal()*offset)
	return points_arc
	
func gen_norm(tn:float):
	var t1=min(max(tn+0.001,0),lf)
	var t2=min(max(tn-0.001,0),lf)
	return (gen_point(t1)-gen_point(t2)).normalized()
func gen_point(t:float):
	pass
	
