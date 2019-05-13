/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_center);	// text moves around center

var rt = t;
var yt = t+textphase;
var wt = t+(textphase*2);

// red layer
var scale = scaleMid + (sin(rt * scaleSpeed) * scaleRange);
draw_set_color(c_red);
draw_text_transformed(x, y, theText, scale, scale, cos(rt * rotSpeed) * rotScale);

// yellow layer
var scale = scaleMid + (sin(yt * scaleSpeed) * scaleRange);
draw_set_color(c_yellow);
draw_text_transformed(x, y, theText, scale, scale, cos(yt * rotSpeed) * rotScale);

// white layer
var scale = scaleMid + (sin(wt * scaleSpeed) * scaleRange);
draw_set_color(c_white);
draw_text_transformed(x, y, theText, scale, scale, cos(wt * rotSpeed) * rotScale);

t += globalSpeed;	// increment timer