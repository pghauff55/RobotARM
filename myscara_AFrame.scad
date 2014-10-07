

include <round_triangle.scad>


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



Aframe();

//Aframe3_top(l2,theta1,l7,theta2,t4,h,r5,r4);


module right_triangle(w,l,h){
alpha=atan2(l,w);
a=sqrt(w*w+l*l);
difference(){
cube(size=[w,l,h]);
translate([0,l,0])
rotate([0,0,-alpha])
cube(size=[a+1,l*cos(alpha+1),h+1]);
}

}
module Aframe(){
//booker rod
//translate([-l2*cos(theta1/2)-1*l7*cos(theta2/2)/3-25,0,0])cylinder(360,4,4,center=true);
translate([0,0,140])Aframe3_base_top(l2,theta1,l7,theta2,t4,h,r5,r4)
//translate([0,0,-230])Aframe3_base_bottom(l2,theta1,l7,theta2,t4,h,r5,r4);
//rotate([180,0,0])translate([0,0,110])rotate([0,0,180])mirror()Aframe3_base_bottom(l2,theta1,l7,theta2,t4,h,r5,r4);
translate([0,0,-t4]){
//Aframe3_top(l2,theta1,l7,theta2,t4,h,r5,r4);
//Aframe3_middle(l2,theta1,l7,theta2,t4,h,r5);
//translate([0,0,-h-2*t4])Aframe3_bottom(l2,theta1,l7,theta2,t4,h,r5,r4);
}
}


module Aframe3_top2(l2,theta1,l7,theta2,t4,h,r5,r4,offset){
translate([offset,0,0])
difference(){
union()
{
translate([0,0,+h/2+t4])rounded_triangle2(theta1,l2,r5,2*t4,6);
//translate([-l2*cos(theta1/2)-l7*cos(theta2/2),0,+h/2+t4])rounded_triangle(theta2,l7,r5,2*t4);

}
//axle1 hole
translate([-offset,0,10])cylinder(h+4*t4+220,6,6,center=true);
//stepper mount hole
translate([-(r4+4+4),0,h/2+2*t4+10])cube(size=[44,44,t4],center=true);
}

}


/*Aframe3_bottom();
translate([-(r4+4+4),0,0])translate([0,0,+h/2+t4])cylinder(8,6,6);
translate([0,0,+h/2+t4])cylinder(8,6,6);
translate([-l2*cos(theta1/2)-l7*cos(theta2/2)/2+r5*cos(theta2/2)/2,0,h/2+t4])cylinder(8,4,4);
*/





module Aframe3_middle(l2,theta1,l7,theta2,t4,h,r5){

//difference(){
//translate([-l2*cos(theta1/2)-l7*cos(theta2/2),0,-h/2+t4])rounded_triangle(theta2,l7,r5,h);

//lm8uu holes
translate([-l7*cos(theta2/2)-l2*cos(theta1/2),0,t4]){
rotate([0,0,theta2/2])translate([l7,0,0])cylinder(h,14,14,center=true);
rotate([0,0,-theta2/2])translate([l7,0,0])cylinder(h,14,14,center=true);
}
translate([-l2*cos(theta1/2)-l7*cos(theta2/2),0,10])cylinder(h,14,14,center=true);

//smooth rods
translate([-l7*cos(theta2/2)-l2*cos(theta1/2),0,t4]){
rotate([0,0,theta2/2])translate([l7,0,0])cylinder(400,4,4,center=true);
rotate([0,0,-theta2/2])translate([l7,0,0])cylinder(400,4,4,center=true);
}
translate([-l2*cos(theta1/2)-l7*cos(theta2/2),0,10])cylinder(400,4,4,center=true);


//booker rod hole
//translate([-l2*cos(theta1/2)-l7*cos(theta2/2)/2+r5*cos(theta2/2)/2,0,0])cylinder(120,6,6,center=true);

//m5 joiner holes
//translate([-l2*cos(theta1/2)-l7*cos(theta2/2)/2+r5*cos(theta2/2)/2+l7/3,0,0])cylinder(120,3,3,center=true);//
//translate([-l2*cos(theta1/2)-l7*cos(theta2/2)/2+r5*cos(theta2/2)/2-l7/6,l7/3,0])cylinder(120,3,3,center=true);
//translate([-l2*cos(theta1/2)-l7*cos(theta2/2)/2+r5*cos(theta2/2)/2-l7/6,-l7/3,0])cylinder(120,3,3,center=true);
//}


}


//translate([-l2*cos(theta1/2)-l7*cos(theta2/2)+r5*cos(theta2/2)+5,0,0])cylinder(200,5,5,center=true);

//translate([0,0,+h/2+4])cylinder(8,6,6,center=true);
module Aframe3_top(l2,theta1,l7,theta2,t4,h,r5,r4){
difference(){
union()
{
translate([0,0,+h/2+t4])mirror()rounded_triangle2(theta1,l2,r5,2*t4,6);
translate([-l2*cos(theta1/2)-l7*cos(theta2/2),0,+h/2+t4])rounded_triangle2(theta2,l7,r5,2*t4,10.5);

}
translate([-70,-27,0])rotate([0,0,90])mirror()right_triangle(22.5,30,100);
translate([-70,27,0])rotate([0,0,90])right_triangle(22.5,30,100);
translate([-60,38.5,10])cube([21,22.5,100],true);
translate([-60,-38.5,10])cube([21,22.5,100],true);
translate([-27.5,0,10])cube([25,22,100],true);

translate([-40,10.9,0])right_triangle(25,12,100);
translate([-40,-10.9,0])rotate([0,0,180])mirror()right_triangle(25,12,100);

translate([-94,40,10])cylinder(100,2.6,2.6,center=true);
translate([-94,-40,10])cylinder(100,2.6,2.6,center=true);



//booker rod hole
translate([-l2*cos(theta1/2)-1*l7*cos(theta2/2)/3-25,0,0])cylinder(200,5,5,center=true);

//bearing holes
translate([0,0,+h/2+3*t4-3.5])cylinder(8,11.3,11.3,center=true);
translate([0,0,+h/2+t4+3.5])cylinder(8,11.3,11.3,center=true);
//axle1 hole
translate([0,0,10])cylinder(h+4*t4+220,6,6,center=true);
//stepper mount hole
translate([-(r4+4+4)-5,0,h/2+2*t4+5])cube(size=[74,44,2*t4],center=true);
//stepper m3 holes
translate([-(r4+4+4),0,0]){
cylinder(h+2*t2+15,4,4,center=true);
translate([0,0,h/2+2*t4-3.5])cylinder(38,13,13,center=true);
translate([16,16,h/2+t4-3.5])cylinder(238,2,2,center=true);
translate([16,-16,h/2+t4-3.5])cylinder(238,2,2,center=true);

translate([-16,16,h/2+t4-3.5])cylinder(238,2,2,center=true);
translate([-16,-16,h/2+t4-3.5])cylinder(238,2,2,center=true);
}



}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module Aframe3_bottom(l2,theta1,l7,theta2,t4,h,r5,r4){
difference(){
union()
{
translate([0,0,+h/2+t4])mirror()rounded_triangle2(theta1,l2,r5,2*t4,6);
translate([-l2*cos(theta1/2)-l7*cos(theta2/2),0,+h/2+t4])rounded_triangle2(theta2,l7,r5,2*t4,10.5);

}
//nutcapture M8
translate([-l2*cos(theta1/2)-1*l7*cos(theta2/2)/3-25,0,h/2+12])hexagon(16,8);
//M8 hole
//translate([-l2*cos(theta1/2)-l7*cos(theta2/2)/2+r5*cos(theta2/2)/2,0,h/2+10])cylinder(2*t4+1,4.5,4.5,center=true);
//booker rod hole
translate([-l2*cos(theta1/2)-1*l7*cos(theta2/2)/3-25,0,0])cylinder(200,5,5,center=true);

//LM8UU bearing holes
translate([-72.5,-15,0])rotate([0,0,90])mirror()right_triangle(32,45,100);
translate([-72.5,15,0])rotate([0,0,90])right_triangle(32,45,100);
translate([-60,31,10])cube([26,32,100],true);
translate([-60,-31,10])cube([26,32,100],true);

translate([-27.5,0,10])cube([25,22,100],true);

translate([-40,10.9,0])right_triangle(25,12,100);
translate([-40,-10.9,0])rotate([0,0,180])mirror()right_triangle(25,12,100);

translate([-94,40,10])cylinder(100,2.6,2.6,center=true);
translate([-94,-40,10])cylinder(100,2.6,2.6,center=true);
//booker rod hole
//translate([-l2*cos(theta1/2)-l7*cos(theta2/2)/2+r5*cos(theta2/2)/2,0,h/2+2*t4+10])cylinder(2*t4+1,5,5,center=true);

//bearing holes
translate([0,0,+h/2+3*t4-3.5])cylinder(8,11.3,11.3,center=true);
translate([0,0,+h/2+t4+3.5])cylinder(8,11.3,11.3,center=true);
//axle1 hole
translate([0,0,10])cylinder(h+4*t4+220,6,6,center=true);
//
//gear 3 bearing and axle holes
translate([-(r4+4+4),0,5]){
cylinder(h+2*t2+15,6,6,center=true);
translate([0,0,h/2+2*t4+2.5])cylinder(8,11.3,11.3,center=true);
translate([0,0,h/2+7.5])cylinder(8,11.3,11.3,center=true);


}

}
}








module Aframe3_base_bottom(l2,theta1,l7,theta2,t4,h,r5,r4){
difference(){
union()
{
//translate([0,0,+h/2+t4])mirror()rounded_triangle2(theta1,l2,r5,2*t4,6);
translate([-l2*cos(theta1/2)-l7*cos(theta2/2),0,+h/2+t4])rounded_triangle2(theta2,l7,12,30,4);

}
translate([-70,-27,0])rotate([0,0,90])mirror()right_triangle(25.5,40,100);
translate([-70,27,0])rotate([0,0,90])right_triangle(25.5,40,100);
translate([-60,39.5,20])cube([23,24.5,100],true);
translate([-60,-39.5,20])cube([23,24.5,100],true);
translate([-65,0,20])cube([31,42.5,100],true);

translate([-94,42.5,10])cylinder(100,2.6,2.6,center=true);
translate([-94,-42.5,10])cylinder(100,2.6,2.6,center=true);



//booker rod hole
translate([-l2*cos(theta1/2)-1*l7*cos(theta2/2)/3-25,0,0])cylinder(200,5,5,center=true);



//stepper mount hole
translate([-l2*cos(theta1/2)-1*l7*cos(theta2/2)/3-25,0,h/2+2*t4+9])cube(size=[44,44,24],center=true);
//stepper m3 holes
translate([-l2*cos(theta1/2)-1*l7*cos(theta2/2)/3-25,0,0]){
cylinder(h+2*t2+15,4,4,center=true);
translate([0,0,h/2+2*t4-3.5])cylinder(38,13,13,center=true);
translate([16,16,h/2+t4-3.5])cylinder(238,2,2,center=true);
translate([16,-16,h/2+t4-3.5])cylinder(238,2,2,center=true);

translate([-16,16,h/2+t4-3.5])cylinder(238,2,2,center=true);
translate([-16,-16,h/2+t4-3.5])cylinder(238,2,2,center=true);
}



}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//translate([0,0,140])Aframe3_base_top(l2,theta1,l7,theta2,t4,h,r5,r4);

module Aframe3_base_top(l2,theta1,l7,theta2,t4,h,r5,r4){
difference(){
union()
{
//translate([0,0,+h/2+t4])mirror()rounded_triangle2(theta1,l2,r5,2*t4,6);
translate([-l2*cos(theta1/2)-l7*cos(theta2/2),0,+h/2+t4])rounded_triangle2(theta2,l7,12,30,4);

}
translate([-70,-22.5,0])rotate([0,0,90])mirror()right_triangle(30,40,100);
translate([-70,22.5,0])rotate([0,0,90])right_triangle(30,40,100);
translate([-60,37.5,20])cube([23,30,100],true);
translate([-60,-37.5,20])cube([23,30,100],true);
translate([-70,0,20])cube([40,32.5,100],true);

translate([-94,42.5,10])cylinder(100,2.6,2.6,center=true);
translate([-94,-42.5,10])cylinder(100,2.6,2.6,center=true);

translate([-127.5,0,20])cube([12,20,100],true);

//booker rod hole
translate([-l2*cos(theta1/2)-1*l7*cos(theta2/2)/3-25,0,0])cylinder(200,5,5,center=true);
//bearing booker rod


translate([-l2*cos(theta1/2)-1*l7*cos(theta2/2)/3-25,0,34])cylinder(8,11.3,11.3,center=true);

translate([-l2*cos(theta1/2)-1*l7*cos(theta2/2)/3-25,0,57])cylinder(8,11.3,11.3,center=true);




}



}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





module Aframe2(){
translate([0,0,-h/2-2*t4])
difference(){
union(){
translate([-l2*cos(theta1/2)-l7*cos(theta2/2),0,0])rounded_triangle(theta2,l7,r5,h+4*t4);

}
translate([-l2*cos(theta1/2)-l7*cos(theta2/2)/2+r5*cos(theta2/2)/2,0,0])cylinder(200,6,6,center=true);
translate([30-l2*cos(theta1/2)-l7*cos(theta2/2),-50,-0.5])cube([60,100,h+4*t4+1]);
translate([-l2*cos(theta1/2)-l7*cos(theta2/2),0,10])cylinder(h+4*t4+220,6,6,center=true);

translate([0,0,h/2+2*t4]){

translate([-100,l2*sin(theta1/2)-r5/2,h/4])rotate([0,90,0])cylinder(300,2,2,center=true);
translate([-100,-l2*sin(theta1/2)+r5/2,h/4])rotate([0,90,0])cylinder(300,2,2,center=true);

translate([-100,l2*sin(theta1/2)-r5/2,-h/4])rotate([0,90,0])cylinder(200,2,2,center=true);
translate([-100,-l2*sin(theta1/2)+r5/2,-h/4])rotate([0,90,0])cylinder(300,2,2,center=true);
}
translate([-100,0,h/2+2*t4]){

translate([-100,l2*sin(theta1/2)-r5/2,h/4])rotate([0,90,0])cylinder(200,4,4,center=true);
translate([-100,-l2*sin(theta1/2)+r5/2,h/4])rotate([0,90,0])cylinder(200,4,4,center=true);

translate([-100,l2*sin(theta1/2)-r5/2,-h/4])rotate([0,90,0])cylinder(200,4,4,center=true);
translate([-100,-l2*sin(theta1/2)+r5/2,-h/4])rotate([0,90,0])cylinder(200,4,4,center=true);
}

}
}




module Aframe1(){
difference(){
union()
{
translate([0,0,-h/2-2*t4])mirror()rounded_triangle(theta1,l2,r5,h+4*t4);


}
translate([-l2*cos(theta1/2)-l7*cos(theta2/2)/2+r5*cos(theta2/2)/2,0,0])cylinder(200,6,6,center=true);

translate([-(r4+4+4),0,h/2+t4+10])cube(size=[44,44,t4],center=true);

translate([l/2,0,0])cube(size=[16+4*r6+l+2*r4,2*r4,h+gap],center=true);

translate([-2*l2*cos(theta1/2),0,0]){
rotate([0,0,theta1/2])translate([l2,0,0])cylinder(h+2*t2+0.1,6,6,center=true);
rotate([0,0,-theta1/2])translate([l2,0,0])cylinder(h+2*t2+0.1,6,6,center=true);
}
//bearings 608
translate([0,0,h/2+2*t4-3.5])cylinder(8,11.3,11.3,center=true);
translate([0,0,h/2+t4-3.5])cylinder(8,11.3,11.3,center=true);

translate([0,0,-h/2-2*t4+3.5])cylinder(8,11.3,11.3,center=true);
translate([0,0,-h/2-t4+3.5])cylinder(8,11.3,11.3,center=true);

translate([0,0,10])cylinder(h+4*t4+220,6,6,center=true);


translate([-(r4+4+4),0,0]){
cylinder(h+2*t2+15,4,4,center=true);
translate([0,0,h/2+2*t4-3.5])cylinder(38,13,13,center=true);
translate([16,16,h/2+t4-3.5])cylinder(238,2,2,center=true);
translate([16,-16,h/2+t4-3.5])cylinder(238,2,2,center=true);

translate([-16,16,h/2+t4-3.5])cylinder(238,2,2,center=true);
translate([-16,-16,h/2+t4-3.5])cylinder(238,2,2,center=true);


//bearing holes
translate([0,0,-h/2-2*t4+3.5])cylinder(8,11.3,11.3,center=true);
translate([0,0,-h/2-t4+3.5])cylinder(8,11.3,11.3,center=true);

}
translate([0,0,0]){

translate([-100,l2*sin(theta1/2)-r5/2,h/4])rotate([0,90,0])cylinder(300,2,2,center=true);
translate([-100,-l2*sin(theta1/2)+r5/2,h/4])rotate([0,90,0])cylinder(300,2,2,center=true);

translate([-100,l2*sin(theta1/2)-r5/2,-h/4])rotate([0,90,0])cylinder(200,2,2,center=true);
translate([-100,-l2*sin(theta1/2)+r5/2,-h/4])rotate([0,90,0])cylinder(300,2,2,center=true);
}
}



}



