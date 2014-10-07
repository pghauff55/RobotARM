include <regular_shapes.scad>


//rounded_triangle3(80,110,10,14,4);
//beam(110,16,4,2,2);

module beam(R,h,w,h1,w1){
rotate([90,0,0])
translate([-R/2,-h/2,0])
rotate([0,90,0]){
linear_extrude(R)polygon(points=[[0,h],[w,h],[w,h-h1],[w-w1,h-h1-w1],[w-w1,h1+w1],[w,h1],[w,0],[0,0]]);
mirror()linear_extrude(R)polygon(points=[[0,h],[w,h],[w,h-h1],[w-w1,h-h1-w1],[w-w1,h1+w1],[w,h1],[w,0],[0,0]]);
}

}
module rounded_triangle_hexagons(angle,R,r1,h,r2){
h1=R*cos(angle/2);
l1=R*sin(angle/2);
h2=r1*sin(angle/2);
l2=r1*cos(angle/2);
//translate([-2*h1/3,0,0])


translate([0,0,h/2]){
hexagon(h+1,r2);
translate([h1,l1,0])hexagon(h+1,r2);
translate([h1,-l1,0])hexagon(h+1,r2);

}

	
}

module rounded_triangle_holes(angle,R,r1,h,r2){
h1=R*cos(angle/2);
l1=R*sin(angle/2);
h2=r1*sin(angle/2);
l2=r1*cos(angle/2);
//translate([-2*h1/3,0,0])


translate([0,0,h/2]){
cylinder(h+1,r2,r2,center=true);
translate([h1,l1,0])cylinder(h+1,r2,r2,center=true);
translate([h1,-l1,0])cylinder(h+1,r2,r2,center=true);

}

	
}
module rounded_triangle3(angle,R,r1,h,r2){

h1=R*cos(angle/2);
l1=R*sin(angle/2);
h2=r1*sin(angle/2);
l2=r1*cos(angle/2);
//translate([-2*h1/3,0,0])
difference(){
union(){
	rotate([0,0,angle/2])translate([R/2,0,h/2])beam(R,h,r2,h/8,r1/4);
	rotate([0,0,-angle/2])translate([R/2,0,h/2])beam(R,h,r2,h/8,r1/4);
	translate([h1,0,h/2])rotate([0,0,90])beam(2*l1,h,r2,h/8,r1/4);
	}
translate([0,0,h/2]){
cylinder(h+1,r2,r2,center=true);
translate([h1,l1,0])cylinder(h+1,r2,r2,center=true);
translate([h1,-l1,0])cylinder(h+1,r2,r2,center=true);

}
}
translate([0,0,h/2]){
		tube(h,r1,r1-r2,center=true);
		translate([h1,l1,0])tube(h,r1,r1-r2,center=true);
		translate([h1,-l1,0])tube(h,r1,r1-r2,center=true);
		}
	
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module rounded_triangle2(angle,R,r1,h,r2){

h1=R*cos(angle/2);
l1=R*sin(angle/2);
h2=r1*sin(angle/2);
l2=r1*cos(angle/2);
//translate([-2*h1/3,0,0])
union(){
difference(){
linear_extrude(h)polygon( points=[[	-h2,		l2	],	[	-h2,		-l2	],	[	h1-h2,	-l1-l2	],	[	h1+r1,		-l1+l2-r1	],	[	h1+r1,		l1-l2+r1	],	[	h1-h2,		l1+l2	]	] );
translate([0,0,h/2]){
cylinder(h,r1,r1,center=true);
translate([h1,l1,0])cylinder(h,r1,r1,center=true);
translate([h1,-l1,0])cylinder(h,r1,r1,center=true);
}
}
translate([0,0,h/2]){
tube(h,r1,r1-r2,center=true);
translate([h1,l1,0])tube(h,r1,r1-r2,center=true);
translate([h1,-l1,0])tube(h,r1,r1-r2,center=true);
}
}
}




module rounded_triangle(angle,R,r,h){

h1=R*cos(angle/2);
l1=R*sin(angle/2);
h2=r*sin(angle/2);
l2=r*cos(angle/2);
union(){
linear_extrude(h)polygon( points=[[	-h2,		l2	],	[	-h2,		-l2	],	[	h1-h2,	-l1-l2	],	[	h1+r,		-l1+l2-r	],	[	h1+r,		l1-l2+r	],	[	h1-h2,		l1+l2	]	] );
translate([0,0,h/2]){
cylinder(h,r,r,center=true);
translate([h1,l1,0])cylinder(h,r,r,center=true);
translate([h1,-l1,0])cylinder(h,r,r,center=true);
}
}
}


//rounded_triangle(30,100,10,50);