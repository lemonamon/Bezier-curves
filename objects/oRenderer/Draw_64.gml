///@desc Renders a cubic bezier curve along the 4 active points

//draw lines between points
draw_set_color(c_red);
draw_line(points.P0.x, points.P0.y, points.P1.x, points.P1.y);
draw_line(points.P1.x, points.P1.y, points.P2.x, points.P2.y);
draw_line(points.P2.x, points.P2.y, points.P3.x, points.P3.y);


//Render main curve

draw_set_color(c_white);

//vars
var t = 0;
var res = 0.01;

//struct to hold prev point of curve
var prevPoint = noone;

while(t <= 1)
{
	//interpolate x and y
	var xx = (power((1 - t), 3) * points.P0.x) + (3 * power((1 - t), 2) * t * points.P1.x) + (3 * (1 - t) * power(t, 2) * points.P2.x) + (power(t, 3) * points.P3.x);
	var yy = (power((1 - t), 3) * points.P0.y) + (3 * power((1 - t), 2) * t * points.P1.y) + (3 * (1 - t) * power(t, 2) * points.P2.y) + (power(t, 3) * points.P3.y);
	
	//draw line and set prevPoint struct
	if(prevPoint != noone) draw_line(prevPoint.x, prevPoint.y, xx, yy);
	prevPoint = {
		x : xx,
		y : yy
	}
	
	//increment
	t += res;
}