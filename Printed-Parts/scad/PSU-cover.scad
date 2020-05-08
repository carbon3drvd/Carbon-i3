//Carbon i3 Modified

// PRUSA iteration3
// PSU Cover
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

x_add = 15;
y_add = 10;
z_add = 0.7;
bracket_screw_hole_heigh = 33;

module PSU_COVER()
{
difference(){
union(){
    
translate([0,0,-1])cube([95+x_add,50+15+y_add,56+z_add]); // Base

translate([-3+(100+x_add)/2-50/2-(14-0.5)/2+1-0.5,0,-3.5])cube([14-0.5,50+15+y_add,5]); // Back pillar 1

translate([-3+(100+x_add)/2+50/2-(14-0.5)/2+1-0.5,0,-3.5])cube([14,50+15+y_add,5]); // Back pillar 2
    
translate([-0.9,0,-3.5])cube([7,50+15+y_add,5]); // Back pillar 3
    
translate([-0.9,0,53])rotate([0,0,0])cube([7,50+15+y_add,5]); // Front pillar

translate([91+4+x_add,0,-1])cube([6,50+15+y_add,56+z_add]); // Base for bracket

translate([-2+0.7+0.3,31.9+6+0.3+0.5,19])cube([2-0.7,2.7,15]); // nipple on the right 45.4-4.6


translate([0+x_add/2,35+y_add/2,46.5+z_add])scale([1.2,1,0.2])rotate([-28,-50,-58])cube([45,45,30]);


//translate([94,20,13])scale([0.2,1.2,1])rotate([-29,-51,-48])cube([30,35,30]);
//translate([10,25,45])scale([1,1,0.3])rotate([-40,-50,-58])cube([40,30,30]);

translate([-1.6+0.7,0,0])cube([1.65,65+y_add,2]); // Frame skirt 1
translate([-1.6+0.7,0,0])cube([1.65,50-16.4-17.6+15+0.9,55+z_add]); // Frame skirt 2
translate([-1.6+0.7,0,51+z_add+0.3])cube([1.65,65+y_add,4-0.3]); // Frame skirt 3
  
}

translate([101+x_add-0.8,35+y_add,(56+z_add)/2-1])rotate([0,90,0])linear_extrude(height = 0.8, convexity = 5)import (file = "bandeira_brasil.dxf", layer = "0");

//translate([101+x_add-0.8,10+y_add,(56+z_add)/2-1])rotate([0,90,0])linear_extrude(height = 0.8, convexity = 5)import (file = "feito_no_brasil.dxf", layer = "0");

translate([101+x_add-0.8,18+y_add,(56+z_add)/2-1+15])rotate([0,90,0])linear_extrude(height = 0.8){ text("Feito no", font = "Swis721 BlkEx BT:style=Bold", size=3.95, center=true); }
translate([101+x_add-0.8,10+y_add,(56+z_add)/2-1+15])rotate([0,90,0])linear_extrude(height = 0.8){ text("Brasil", font = "Swis721 BlkEx BT:style=Bold", size=5.3, center=true); }


translate([55,2+(73-60)/2,-10])cube([1.0,60,20]);
translate([55-40,2+(73-60)/2+5,-10])cube([1.0,55,20]);
translate([55+40,2+(73-60)/2,-10])cube([1.0,60,20]);

translate([74,2+(73-30)/2+10,45])cube([1.0,35,20]);
translate([55-45,2+(73-60)/2,45])cube([1.0,60,20]);
translate([55+50,2+(73-50)/2+5,45])cube([1.0,50,20]);
//#translate([55-45,2+(73-50)/2+5,45])cube([1.0,50,20]);


//pretty corners
translate([-11,-2,-2])rotate([0,0,-45])cube([10,10,58+z_add]);
translate([95-3+5+1+x_add,-2,-2])rotate([0,0,-45])cube([10,10,58+z_add]);

translate([-3,-9,-5])rotate([-45,0,0])cube([130+x_add,10,10]);
translate([-3,-12+2,56+z_add+2])rotate([-45,0,0])cube([130+x_add,10,10]);

translate([-3,45+15+y_add,-5])rotate([-45,0,0])cube([130+x_add,10,10]);
translate([-3,45+15+y_add,59+z_add])rotate([-45,0,0])cube([130+x_add,10,10]);

translate([95-3+3+x_add,70+y_add,-2])rotate([0,0,-45])cube([10,10,58+z_add]);


translate([95+x_add,0-10,-20])rotate([0,-45,-45])cube([20,20,20]);
translate([95+x_add,0-10,45+z_add])rotate([0,-45,-45])cube([20,20,20]);


translate([95+x_add,60+y_add,-10])rotate([-35,-45,-45])cube([20,20,20]);
translate([95+x_add,60+y_add,65+z_add])rotate([-55,48,-48])cube([20,20,20]);

//translate([79+x_add,-5,68.5+z_add])rotate([0,45,0])cube([20,90+y_add,20]);

//translate([79+x_add,4,-14.5])rotate([0,45,0])cube([20,90+y_add,20]);

//translate([-14,-5,68.5+z_add])rotate([0,45,0])cube([20,90+y_add,20]);

translate([3,2,2])cube([89.02+x_add,50.02+15+y_add,50.02-0.7+z_add]); // main cutout

translate([-3,50-16.4+15,2])cube([100+x_add,16.5+y_add,50-0.7+z_add]); // insert cutout

//translate([-3,50-16.4-15.6+15,2])cube([10,100+y_add,17]); // right bottom cutout

translate([85+2+x_add,50-16.4-17.6+15+0.9,2])cube([10,100+y_add,50-0.7+z_add]); // left bottom cutout

translate([-3,50-16.4-17.6+15+0.9,2])cube([100+x_add,100+y_add,10]); //  bottom cutout

translate([5.5+x_add,0,0+z_add]){
//translate([45,2,40])cube([27.5,31.9,30]); // socket cutout
translate([45,6,40])cube([29,20,30]); // socket cutout
//translate([45-4.5,2+15.6,40])cylinder(r=2,h=50, $fn=8); // socket right hole cutout
translate([45-5.5,6+20/2,40])cylinder(r=1.75,h=50, $fn=8); // socket right hole cutout
//translate([45-4.5+37-0.5,2+15.6,40])cylinder(r=2,h=50, $fn=8); // socket left hole cutout
translate([45+29+5.5,6+20/2,40])cylinder(r=1.75,h=50, $fn=8); // socket left hole cutout

//translate([1,2,44])cube([20,14,30]); // switch cutout

//translate([45-4.5,2+15.6,40])cylinder(r=3.25,h=15-1.5, $fn=6); // socket left hole cutout nuttrap
translate([45-5.5,6+20/2,40])cylinder(r=3.25,h=15-1.5, $fn=6); // socket right hole cutout nuttrap
    
//translate([45-4.5+37-0.5,2+15.6,40])cylinder(r=3.25,h=15-1.5, $fn=6); // socket left hole cutout nuttrap
translate([45+29+5.5,6+20/2,40])cylinder(r=3.25,h=15-1.5, $fn=6); // socket left hole cutout nuttrap
    
}

//translate([20,50,54.5])linear_extrude(height = 1) {        text("Prusa3D", center=true);      }

translate([8+x_add/2,50+y_add/2,54.5+z_add])linear_extrude(height = 1) {
       text("Carbon i3", font = "Swis721 BlkEx BT:style=Bold", size=8, center=true);
     }

/*
translate([8,40-1+15,40])cylinder(r=2,h=50,$fn=15); //  left front mounthole cutout
translate([8,40-1+15,53.6])cylinder(r1=2, r2=3.5,h=1.5,$fn=15);

translate([87,40-1+15,40])cylinder(r=2,h=50,$fn=15); //  right front mounthole cutout
translate([87,40-1+15,53.6])cylinder(r1=2, r2=3.5,h=1.5,$fn=15);
*/

translate([-3+(100+x_add)/2-50/2+1-0.5,32+bracket_screw_hole_heigh,-10])cylinder(r=2.5,h=50,$fn=15); //  left back mounthole cutout
translate([-3+(100+x_add)/2-50/2+1-0.5,32+bracket_screw_hole_heigh,-3.7])cylinder(r2=1.95, r1=4.8,h=2.6,$fn=15);

translate([-3+(100+x_add)/2+50/2+1-0.5,32+bracket_screw_hole_heigh,-10])cylinder(r=2.5,h=50,$fn=15); //  right back mounthole cutout
translate([-3+(100+x_add)/2+50/2+1-0.5,32+bracket_screw_hole_heigh,-3.7])cylinder(r2=1.95, r1=4.8,h=2.6,$fn=15);




translate([130+x_add,32+bracket_screw_hole_heigh,55-4-25+25/2])rotate([0,-90,0])cylinder(r=2.5,h=50,$fn=35); // Left side bracket screw hole
translate([101.1+x_add,32+bracket_screw_hole_heigh,55-4-25+25/2])rotate([0,-90,0])cylinder(r2=1.95, r1=4.8,h=2.6,$fn=15);
     
translate([130+x_add,32+bracket_screw_hole_heigh,55-4-25-25/2])rotate([0,-90,0])cylinder(r=2.5,h=50,$fn=35); // Left side bracket screw hole
translate([101.1+x_add,32+bracket_screw_hole_heigh,55-4-25-25/2])rotate([0,-90,0])cylinder(r2=1.95, r1=4.8,h=2.6,$fn=15);


translate([10,18,25])rotate([0,-90,0])cylinder(r=4.5,h=20,$fn=6);
translate([10,18,45])rotate([0,-90,0])cylinder(r=4.5,h=20,$fn=6);

for(i=[0:10]){
translate([10+i,6,-10])cylinder(r=3,h=50); //  left back mounthole cutout
}



}
}

module PSU_Y_REINFORCEMENT()
{
translate([-5.9,0,0])difference()
{
    union()     // base shape
        {
            translate([ 59.5, 0, -18 ]) cube([ 33, 6, 19 ]);  // reinforcement plate
            translate([ 73.5, 5, -18 ]) cube([ 5, 16, 19 ]);  // vertical_reinforcement    
        }
    union ()    // cutouts
        {
            
            //translate([ 88-0.5, 8, -10.5 ]) rotate([ 90, 0, 0]) cylinder( h = 10, r = 1.6, $fn=30 );  //hole A1
            //translate([ 88, 8, -10.5 ]) rotate([ 90, 0, 0]) cylinder( h = 10, r = 1.6, $fn=30 );  //hole A
            //translate([ 88+0.5, 8, -10.5 ]) rotate([ 90, 0, 0]) cylinder( h = 10, r = 1.6, $fn=30 );  //hole A2
            
            //translate([ 68-0.5, 8, -10.5 ]) rotate([ 90, 0, 0 ]) cylinder( h = 10, r = 1.6, $fn=30 );  //hole B1
            //translate([ 68, 8, -10.5 ]) rotate([ 90, 0, 0 ]) cylinder( h = 10, r = 1.6, $fn=30 );  //hole B
            //translate([ 68+0.5, 8, -10.5 ]) rotate([ 90, 0, 0 ]) cylinder( h = 10, r = 1.6, $fn=30 );  //hole B2
            
            translate([ 87.5, -8, -20 ]) rotate([ 0, 45, 0 ]) cube([ 10, 20, 10 ]);  //corner cut
            translate([ 52.5, -8, -20 ]) rotate([ 0, 45, 0 ]) cube([ 10, 20, 10 ]);  //corner cut
            translate([ 68.5, 20, -34 ]) rotate([ 45, 0, 0 ]) cube([ 15, 23, 20 ]);  //vertical reinf cutout
            
            
            
            
            translate([ 88, 8, -11.5 ]) rotate([ 90, 0, 0]) cylinder( h = 10, r = 1.8, $fn=30 );  //hole A
            translate([ 68, 8, -11.5 ]) rotate([ 90, 0, 0 ]) cylinder( h = 10, r = 1.8, $fn=30 );  //hole B
            
            translate([ 88, 8, -9.5 ]) rotate([ 90, 0, 0]) cylinder( h = 10, r = 1.8, $fn=30 );  //hole A
            translate([ 68, 8, -9.5 ]) rotate([ 90, 0, 0 ]) cylinder( h = 10, r = 1.8, $fn=30 );  //hole B
            
            translate([ 86.2, -10, -11.5 ]) cube([ 3.6, 20, 2 ]);  // hole cut extension
            translate([ 66.2, -10, -11.5 ]) cube([ 3.6, 20, 2 ]);  // hole cut extension
            
            
        }
}
}

module FINAL_PART(){
    union()
        {
            PSU_COVER();
            PSU_Y_REINFORCEMENT();
        }   
}

rotate([90,0,0])FINAL_PART();
//FINAL_PART();


