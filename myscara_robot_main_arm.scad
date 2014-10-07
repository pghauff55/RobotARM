include <round_triangle.scad>
include <parametric_involute_gear_v5.scad>


include <myscara_AFrame4.scad>
include <myscara_main_gear.scad>


r1=50;
h=42;
l=50;
t=12;
r2=18;
r3=33.5;//gear radius
stepper_w=42;
stepper_l=48;
bearing_r=11.3;
bearing_t=7;
gear_ratio=3;
r4=66.5;//gear1 main radius
t2=20;
r5=16;
l2=58;
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
theta1=50;
theta2=70;
l7=110;


axle();
main_gear_part();
stepper();
gear2();
Aframe();

//Aframe3_middle(l2,theta1,l7,theta2,t4,400,4);


//Aframe2();
//cylinder(h,r4,r4,center=true);
//base
//translate([-l2,0,-h7/2])cylinder(20,80,80,center=true);

//booker-rod
translate([l5/2-10,0,0])rotate([0,90,0])cylinder(l5,4,4,center=true);

//axle3
translate([l5,0,0])cylinder(h+2*t3+2*t4+5,4,4,center=true);


//bevel1
translate([l5-r7,0,0])rotate([0,90,0])import("parametric_involute_gear_v5__17_teeth_bevel_gearM8.stl");

//bevel2
translate([l5,0,h-2])rotate([0,180,0])rotate([0,0,11])import("parametric_involute_gear_v5__17_teeth_bevel_gearM8.stl");



translate([130,0,0])rotate([0,90,0])tube(120,11.3,4,center=true);


//second arm
translate([l5,0,0])
difference(){
union(){
cylinder(h+4*t4,r8,r8,center=true);
translate([l6/2,0,0])cube(size=[l6,2*r8,h/2],center=true);
}


//cube(size=[2*r7,2*r7,h+2*t4],center=true);
}


//head
translate([l5+l6,0,0])cylinder(2*r8,16,16,center=true);

//hub
translate([l5,0,0])
difference(){
union(){
cylinder(h+t4,r7,r7,center=true);
translate([0,0,h/2+t4/2])cube(size=[2*r7-5,25,16],center=true);

translate([0,0,-h/2-t4/2])cube(size=[2*r7-5,25,16],center=true);}
cylinder(h+t4+0.1,r7-7,r7-7,center=true);
cylinder(h+4*t3+5,4.3,4.3,center=true);
translate([25,0,0])cube(size=[h,65,20],center=true);

}


/*
difference(){
//stepper top plate
translate([-r4-10,0,(h+2*t2)/2+3.5])cube(size=[stepper_w,stepper_w+23,7],center=true);
translate([-r4-10,0,(h+2*t2)/2+3.5]){
translate([stepper_w/2-5,stepper_w/2+5,0])cylinder(10,2,2,center=true);
translate([stepper_w/2-5,-stepper_w/2-5,0])cylinder(10,2,2,center=true);
translate([-stepper_w/2+5,stepper_w/2+5,0])cylinder(10,2,2,center=true);
translate([-stepper_w/2+5,-stepper_w/2-5,0])cylinder(10,2,2,center=true);

}
}
//stepper bottom plate
difference(){
translate([-r4-10,0,-(h+2*t2)/2-3.5])cube(size=[stepper_w,stepper_w+23,7],center=true);
translate([-r4-10,0,-(h+2*t2)/2-3.5]){
translate([stepper_w/2-5,stepper_w/2+5,0])cylinder(10,2,2,center=true);
translate([stepper_w/2-5,-stepper_w/2-5,0])cylinder(10,2,2,center=true);
translate([-stepper_w/2+5,stepper_w/2+5,0])cylinder(10,2,2,center=true);
translate([-stepper_w/2+5,-stepper_w/2-5,0])cylinder(10,2,2,center=true);

}
}

*/

//gear3
translate([-(r4+4+4),0,0]){
cylinder(h+2*t2+15,4,4,center=true);
translate([0,0,-h/2])gear (
	number_of_teeth=17,
	circular_pitch=180,
	pressure_angle=30,
	clearance = 0.2,
	gear_thickness = h,
	rim_thickness = h,
	rim_width = 0.5,
	hub_thickness =h,
	hub_diameter=10,
	bore_diameter=8,
	circles=0);
}





/*
gear (
	number_of_teeth=93,
	circular_pitch=180,
	pressure_angle=30,
	clearance = 0.2,
	gear_thickness = 12,
	rim_thickness = 12,
	rim_width = 0.5,
	hub_thickness =12,
	hub_diameter=10,
	bore_diameter=r1,
	circles=0);
*/

module axle(){ 
cylinder(h+2*t2+5,6,6,center=true);
}
module 628bearing(){
translate([0,0,3.5])cylinder(7,11,11,center=true);

}
module 628bearing_cutout(){
translate([0,0,3.5])cylinder(7.1,11.3,11.3,center=true);

}

