
include <regular_shapes.scad>
include <parametric_involute_gear_v5.scad>
include <round_triangle.scad>
r1=63;
h=48;
l=50;
t=12;
r2=22;
r3=33.5;//gear radius
stepper_w=42;
stepper_l=48;
bearing_r=11.3;
bearing_t=7;
gear_ratio=3;
r4=53;//gear1 main radius
t2=20;
r5=14;
l2=98;
l3=l2*(1+sin(60));
l4=l2*(1+cos(120));
gap=7;
r6=10;//gear3 radius
l5=220;
r7=37;
t3=10;
t4=10;
r8=8;//second arm width=2*r8
l6=140;//second arm length
h7=300;
theta1=30;
theta2=60;
l7=2*l2*sin(theta1/2);

main_gear_part();

//main part/////////////////////////////////////////////

//cylinder(20,65,65,center=true);
//translate([-stepper_l/2-8,0,0])cube(size=[stepper_l,stepper_w,stepper_w],center=true);


module main_gear_part(){
difference(){
union(){
//translate([l/2+r1-13,0,0])rotate([0,90,0])tube(l,h/2,h/2-11.3,center=true);
//cylinder(h,r1,r1,center=true);
difference(){
scale([0.6,0.6,1.0])translate([0,0,-h/2])gear (
	number_of_teeth=97,
	circular_pitch=400,
	pressure_angle=17,
	clearance = 0.3,
	gear_thickness = h,
	rim_thickness = h,
	rim_width = 0.5,
	hub_thickness =h,
	hub_diameter=20,
	bore_diameter=196,
	circles=0);

translate([r1+10,0])cube(size=[50,140,h+1],center=true);
}
//cylinder(h,r2,r2,center=true);
translate([0,0,0])cube(size=[20,2*r1,h],center=true);
translate([r1-21,0])cube(size=[12,90,h],center=true);
}
//cylinder(h,r1-t,r1-t,center=true);

//stepper cut outs
translate([12,0,0])cube(size=[5,40,39],center=true);
translate([0,0,0])rotate([0,90,0])cylinder(20,13,13,center=true);
translate([0,16,16])rotate([0,90,0])cylinder(100,2,2,center=true);
translate([0,16,-16])rotate([0,90,0])cylinder(100,2,2,center=true);
translate([0,-16,16])rotate([0,90,0])cylinder(100,2,2,center=true);
translate([0,-16,-16])rotate([0,90,0])cylinder(100,2,2,center=true);


//nut captures
translate([0,0,15])rotate([0,0,90])hexagon(12,8);
translate([0,0,-15])rotate([0,0,90])hexagon(12,8);
//axle cut
cylinder(100,4,4,center=true);
//axle2 cut
translate([r1-10,0,0])rotate([0,90,0])cylinder(40,6,6,center=true);
translate([r1-24,0,-15.5])rotate([0,90,0])cylinder(20,4,4,center=true);

//bearing axle2
translate([-stepper_l/2-8,0,0])cube(size=[stepper_l+1,stepper_w+1,stepper_w+10],center=true);


}
}





