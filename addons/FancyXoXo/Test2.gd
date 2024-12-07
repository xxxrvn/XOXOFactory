extends Node2D
var t1=0
var t2=0
var t3=0
var t4=0
var t5=0
var walkto=Vector2(100,600)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t1+=delta*randf_range(0.1,2.)
	t2+=delta*randf_range(0.1,2.)
	t3+=delta*randf_range(0.1,2.)
	t4+=delta*randf_range(0.1,2.)
	t5+=delta*randf_range(0.1,2.)
	$WPDTest.PolyHandler.Points[0].p.x+=sin(t1*1.2)*8/2
	$WPDTest.PolyHandler.Points[0].p.y+=sin(t1*1.1)*7/2
	$WPDTest.PolyHandler.Points[0].f=(sin(t1)+1.1)
	
	$WPDTest.PolyHandler.Points[1].f=(sin(t2)+1.4)*5
	$WPDTest.PolyHandler.Points[1].p.x+=sin(t2*1.17+.2)*7.3/2
	$WPDTest.PolyHandler.Points[1].p.y+=sin(t2*1.65+.3)*6.4/2
	
	
	$WPDTest.PolyHandler.Points[2].f=(sin(t3)+1.3)*3+1
	$WPDTest.PolyHandler.Points[2].p.x+=sin(t3*1.34+.28)*7.4/2
	$WPDTest.PolyHandler.Points[2].p.y+=sin(t3*1.43+.27)*7.5/2
	
	$WPDTest.PolyHandler.Points[3].f=(sin(t4)+1.7)*2+2
	$WPDTest.PolyHandler.Points[3].p.x+=sin(t4*1.41+.19)*8.3/2
	$WPDTest.PolyHandler.Points[3].p.y+=sin(t4*1.14+.145)*8.5/2
	
	$WPDTest.PolyHandler.Points[4].p.x+=sin(t5*1.5+1.8)*6.5/2
	$WPDTest.PolyHandler.Points[4].p.y+=sin(t5+1.56)*6/2
	$WPDTest.PolyHandler.Points[4].f=(sin(t5)+1.2)
	
	$WPDTest.PolyHandler.Points[0].p=($WPDTest.PolyHandler.Points[0].p*30.+walkto)/31
	for x in range(4):
		if ($WPDTest.PolyHandler.Points[x+1].p-$WPDTest.PolyHandler.Points[x].p).length()>100:
			$WPDTest.PolyHandler.Points[x+1].p+=$WPDTest.PolyHandler.Points[x+1].p.direction_to($WPDTest.PolyHandler.Points[x].p)*4
		for y in range(5):
			if x!=y:
				if ($WPDTest.PolyHandler.Points[y].p-$WPDTest.PolyHandler.Points[x+1].p).length()<50:
					$WPDTest.PolyHandler.Points[x+1].p-=$WPDTest.PolyHandler.Points[x+1].p.direction_to($WPDTest.PolyHandler.Points[y].p)*6
	$WPDTest.dynamic()
	if ($WPDTest.PolyHandler.Points[0].p-walkto).length()<30:
		walkto=Vector2(randf_range(100,600),randf_range(100,600))
	
	
