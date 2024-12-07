extends Node2D
var t1=0
var t2=0
var t3=0
var t4=0
var t5=0

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
	$WPDTest.PolyHandler.Points[0].p.x+=sin(t1*1.2)*8/4
	$WPDTest.PolyHandler.Points[0].p.y+=sin(t1*1.1)*7/4
	$WPDTest.PolyHandler.Points[0].f=(sin(t1)+1.1)
	
	$WPDTest.PolyHandler.Points[1].f=(sin(t2)+1.4)*5
	$WPDTest.PolyHandler.Points[1].p.x+=sin(t2*1.17+.2)*7.3/4
	$WPDTest.PolyHandler.Points[1].p.y+=sin(t2*1.65+.3)*6.4/4
	
	
	$WPDTest.PolyHandler.Points[2].f=(sin(t3)+1.3)*3+1
	$WPDTest.PolyHandler.Points[2].p.x+=sin(t3*1.34+.28)*7.4/4
	$WPDTest.PolyHandler.Points[2].p.y+=sin(t3*1.43+.27)*7.5/4
	
	$WPDTest.PolyHandler.Points[3].f=(sin(t4)+1.7)*2+2
	$WPDTest.PolyHandler.Points[3].p.x+=sin(t4*1.41+.19)*8.3/4
	$WPDTest.PolyHandler.Points[3].p.y+=sin(t4*1.14+.145)*8.5/4
	
	$WPDTest.PolyHandler.Points[4].p.x+=sin(t5*1.5+1.8)*6.5/4
	$WPDTest.PolyHandler.Points[4].p.y+=sin(t5+1.56)*6/4
	$WPDTest.PolyHandler.Points[4].f=(sin(t5)+1.2)
	$WPDTest.dynamic()
	
	$WPDTest2.PolyHandler.variantX+=sin(t3)
	$WPDTest2.PolyHandler.variantY+=sin(t4)
	$WPDTest2.PolyHandler.standartX+=sin(t1*2)*2
	$WPDTest2.PolyHandler.standartY+=sin(t2*2)*2
	$WPDTest2.PolyHandler.length+=sin(t1)/100.
	$WPDTest2.PolyHandler.pseudoX+=sin(t2)/100.
	$WPDTest2.PolyHandler.pseudoY+=sin(t3)/100.
	$WPDTest2.PolyHandler.powerX+=sin(t2*1.5)/100.
	$WPDTest2.PolyHandler.powerY+=sin(t3*1.5)/100.
	$WPDTest2.PolyHandler.adjustX+=sin(t1*1.3)/100.
	$WPDTest2.PolyHandler.adjustY+=sin(t2*1.3)/100.
	
	
	$WPDTest2.dynamic()
	
	
