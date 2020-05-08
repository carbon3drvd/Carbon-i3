//Carbon i3 Modified

// PRUSA iteration3
// RAMBo base
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

offsy=15;
offsx=19.7; // ramps offset
exo=50; // extruder cable holder offset
//mof = 11.5; // middle side mounting
hof=-40; // heatbed x offset

module ThinCylinder(r,h,t) {
    difference() {
        cylinder(r=r,h=h);
        translate([0,0,-1]) cylinder(r=r-t,h=h+2);
    }
}

module FanGrill(r,spacing1=1.6,spacing2=8,height=3) {
    translate([0,0,-0.01]) difference() {
        cylinder(r=r,h=100);
        rotate([0,0,45]) cube([spacing1,100,height*2],center=true);
        rotate([0,0,-45]) cube([spacing1,100,height*2],center=true);
        for(x=[2.5:spacing2:r]) {
            ThinCylinder(x,height,spacing1);
        }
    }
}


// main body
module main_body(){
    // side panel
    cube( [ 118.5 , 92 , 2 ] );  

    // upper panel
    cube( [ 1.5 , 92 , 35 ] );  
    // rear panel
    translate( [ 0 , 90 , 0 ] ) cube( [ 105.5 , 2 , 35 ] ); 
    
    // heatbed ziptie reinforcement
    translate( [ 63+hof , 88.5 , 0.5 ] ) cube( [ 6.5 , 2 , 34.5 ] );   
    translate( [ 63+hof -12, 88.5 , 0.5 ] ) cube( [ 6.5 , 2 , 34.5 ] );   

    // upper panel frame reinforcement
    translate( [ 0 , 0 , 1 ] ) cube( [ 5.5 , 7 , 34 ] );  

    // side panel reinforcement
    translate( [ 0 , 0 , 1 ] ) cube( [ 9 , 92 , 3 ] );  
    translate( [ 98 , 0 , 0 ] ) cube( [ 9 , 92 , 4 ] ); 
    
difference()
    {
    // bottom side reinforcement    
    translate( [ 98 , 86 , 0 ] ) cube( [ 7.5 , 6 , 35 ] ); 
    translate( [ 96 , 79 , 0 ] ) rotate([0,0,45]) cube( [ 7.5 , 6 , 36 ] ); 
    }
    translate( [ 0 , 85 , 0 ] ) cube( [ 5.5 , 7 , 35 ] ); 

    // screw mounting block
    translate( [ 54 , 84 , 0 ] ) cube( [ 9.5 , 7 , 35 ] );  

    // frame side panel
    translate( [ 20 , 0 , 0 ] ) cube( [ 80 , 3 , 5 ] );  

    // RAMBo mounting holes

    translate( [ offsx+82.55 , offsy , 0 ] ) rotate([0,0,90]) cylinder( h = 8, r = 5.5, $fn=6); 
    translate( [ offsx+82.55 , offsy+48.5 , 0 ] ) rotate([0,0,90]) cylinder( h = 8, r = 5.5, $fn=6); 
    translate( [ offsx+7.65 , offsy , 0 ] ) cylinder( h = 8, r = 5.5, $fn=6); 
    translate( [ offsx , offsy+48.5 , 0 ] ) cylinder( h = 8, r = 5.5, $fn=6); 

    // corners reinforcement
    translate( [ 0 , 75 , 1 ] ) cube( [ 13 , 16 , 6 ] );  
    translate( [ 0 , 70.25 , 1 ] ) cube( [ 9 , 11 , 6 ] ); 
    translate( [ 0 , 7.75 , 1 ] ) cube( [ 9 , 11 , 6 ] ); 
    translate( [ 0 , 0 , 1 ] ) cube( [ 13 , 14 , 6 ] ); 

    // frame mounting screw blocks
    //upper
    translate( [ 1 , 0 , 0 ] ) cube( [ 28 , 4 , 10 ] );  
    translate( [ 18.45 , 0 , 0 ] ) cube( [ 3 , 4 , 5.5] ); 
    
    //mid
//    translate( [ 1+mof , 0 , 0 ] ) cube( [ 28 , 4 , 10 ] );  
//    translate( [ 18.45+mof , 0 , 0 ] ) cube( [ 3 , 4 , 5.5] ); 
    
    //lower
    translate( [ 98 , 0 , 0 ] ) cube( [ 20.5 , 4 , 10 ] ); 

    // heatbed filament holder body
    translate( [ 81.6+hof, 90.35 , 24 ] ) rotate([0,90,0]) cylinder( h = 18, r = 5, $fn=6); 

    // door closing corner
    translate( [ 102 , 88.5 , 35 ] ) cylinder( h = 3, r1=2.5, r2=1, $fn=30);   

    // doors pin upper
    translate( [ 2 , 85 , 31 ] ) cube( [ 6 , 7 , 4] ); 
    translate( [ 4 , 88.5 , 35 ] ) cylinder( h = 3, r1=2.5, r2=1, $fn=30);   

    // x-axis cables entry hole body
    translate( [ 89 , 2 , 0 ] ) cylinder( h = 5, r = 6, $fn=6);   
    //z-axis switch hole
    translate( [ 85 , 1.5 , 0 ] ) cylinder( h = 5, r = 4, $fn=6); //   
}


module ventilation_holes()
{
   for ( i = [-4 : 6] )
   {
      translate([36+offsx + (i*5.5),13,-1]) cube([3.65,18+50,1.2]); // middle bars
      translate([36+offsx + (i*5.5),13,-1]) cube([3.65,18,3.01]); // L
      translate([36+offsx + (i*5.5),13+25,-1]) cube([3.65,18,3.01]); // M
      translate([36+offsx + (i*5.5),13+50,-1]) cube([3.65,18,3.01]); // R
   }
}

module cutouts(){
    // side     
//    translate( [ 17 , 20 , 1 ] ) cube( [ 69 , 60 , 3 ] );   
    translate( [ 16+offsx , 13 , 1 ] ) cube( [ 58.65 , 68 , 3 ] );  

    // RAMBo M3 screws
    translate( [ offsx+82.55 , offsy , -1 ] ) cylinder( h = 10, r = 1.9, $fn=30);  
    translate( [ offsx+82.55 , offsy+48.5, -1 ] ) cylinder( h = 10, r = 1.9, $fn=30);  
    translate( [ offsx+7.65 , offsy , -1 ] ) cylinder( h = 10, r = 1.9, $fn=30);  
    translate( [ offsx , offsy+48.5 , -1 ] ) cylinder( h = 10, r = 1.9, $fn=30);     
    
    translate( [ offsx+82.55, offsy, 6 ] ) cylinder( h = 3, r1 = 1.9, r2=2.4, $fn=30);  
    translate( [ offsx+82.55 , offsy+48.5 , 6 ] ) cylinder( h = 3, r1 = 1.9, r2=2.4, $fn=30);  
    translate( [ offsx+7.65 , offsy , 6 ] ) cylinder( h = 3, r1 = 1.9, r2=2.4, $fn=30);  
    translate( [ offsx , offsy+48.5, 6 ] ) cylinder( h = 3, r1 = 1.9, r2=2.4, $fn=30);     

    translate( [ 2 , 0 , -1 ] )ventilation_holes();
    
    // frame mounting screws
    //upper    
    translate( [ 18.5, -2 , 15.6 ] ) rotate([0,45,0]) cube( [ 15 , 10 , 10] );     
    translate( [ 16.5 , 8 , 5 ] ) rotate([90,0,0]) cylinder( h = 10, r = 1.6, $fn=30);   
    translate( [ 16.5 , 9 , 5 ] ) rotate([90,0,0]) cylinder( h = 5, r = 3, $fn=30);   
    translate( [ 15.15 , -2 , 5 ] ) cube( [ 2.7 , 7 , 10] ); 
    translate( [ 15.1 , -2 , 7 ] ) rotate([0,5,0]) cube( [ 2.8 , 7 , 10] ); 
    translate( [ 15.1 , -2 , 7 ] ) rotate([0,-5,0]) cube( [ 2.8 , 7 , 10] ); 
    
    // middle

//    translate( [ 18.5+mof, -2 , 15.6 ] ) rotate([0,45,0]) cube( [ 15 , 10 , 10] );     
//    translate( [ 16.5+mof , 8 , 5 ] ) rotate([90,0,0]) cylinder( h = 10, r = 1.6, $fn=30);   
//    translate( [ 16.5+mof , 9 , 5 ] ) rotate([90,0,0]) cylinder( h = 5, r = 3, $fn=30);   
//    translate( [ 15.15+mof , -2 , 5 ] ) cube( [ 2.7 , 7 , 10] ); 
//    translate( [ 15.1+mof , -2 , 7 ] ) rotate([0,5,0]) cube( [ 2.8 , 7 , 10] ); 
//    translate( [ 15.1+mof , -2 , 7 ] ) rotate([0,-5,0]) cube( [ 2.8 , 7 , 10] ); 

    //lower
    translate( [ 110.5 , 9 , 5 ] ) rotate([90,0,0]) cylinder( h = 10, r = 1.6, $fn=30);   
    translate( [ 110.5 , 9 , 5 ] ) rotate([90,0,0]) cylinder( h = 5, r = 3, $fn=30);       
    translate( [ 118.5 , -2 , 6 ] ) rotate([0,-45,0]) cube( [ 5 , 15 , 15] ); 
    translate( [ 94.5 , -2 , 8.5 ] ) rotate([0,45,0]) cube( [ 5 , 8 , 15] ); 
    translate( [ 0 , -2 , -5 ] ) cube( [ 120 , 15 , 5] ); 
    translate( [ 109.15 , -2 , 5 ] ) cube( [ 2.7 , 15 , 10] ); 
    translate( [ 109.3 , -2 , 6.5 ] ) rotate([0,5,0]) cube( [ 2.5 , 15 , 10] ); 
    translate( [ 109.2 , -2 , 6.5 ] ) rotate([0,-5,0]) cube( [ 2.5 , 15 , 10] ); 

    // door closing screw
    translate( [ 58.5 , 88 , -1 ] ) cylinder( h = 43, r = 1.9, $fn=30);  


    // heatbed cable opening hole
    difference()
    {
    translate( [ 75.5+hof , 94 , 24 ] ) rotate([90,90,0]) cylinder( h = 5, r = 7, $fn=6); 
    translate( [ 71+hof , 80 , 13.5 ] ) cube( [ 8 , 15 , 5] ); 
    }
    translate( [ 73+hof , 80 , 20.5 ] ) cube( [ 5 , 15 , 15] ); 

    // heatbed cable ziptie holes
    translate( [ 64+hof , 87 , 30 ] ) cube( [ 4 , 10 , 2 ] );   
    translate( [ 64+hof , 87 , 16 ] ) cube( [ 4 , 10 , 2 ] );   

    translate( [ 64+hof -12, 87 , 30 ] ) cube( [ 4 , 10 , 2 ] );   
    translate( [ 64+hof -12, 87 , 16 ] ) cube( [ 4 , 10 , 2 ] );   


    // heatbed filament holder hole
    translate( [ 81+hof , 89 , 24 ] ) rotate([0,90,0]) cylinder( h = 15, r = 1.8, $fn=30);   
    translate( [ 81+hof , 89 , 24 ] ) rotate([0,90,0]) cylinder( h = 2, r = 2, r2=1.8, $fn=30);   
    translate( [ 70+hof , 92 , 15 ] ) cube( [ 30 , 10 , 15] ); 

    // Reset hole
    translate( [ 81, 87, 25.5 ] ) rotate([-90,0,0]) cylinder( h = 10, r = 2, $fn=30); 

    // nut traps HEX
    
    translate( [ offsx+82.55 , offsy, -1 ] ){
    cylinder( h = 4, r = 3.2, $fn=6);  
    }
    
    translate( [ offsx+82.55 , offsy+48.5 , -1 ] ){
    cylinder( h = 4, r = 3.2, $fn=6);    
    }

    translate( [ offsx+7.65 , offsy  , -1 ] ){
    cylinder( h = 4, r = 3.2, $fn=6);   
    }
    
    translate( [ offsx , offsy+48.5 , -1 ] ){
    cylinder( h = 4, r = 3.2, $fn=6);   
    }

    translate( [ offsx+82.55 , offsy , -1 ] ) cylinder( h = 1.5, r1 = 5, r2=3.2, $fn=6);  
    translate( [ offsx+82.55 , offsy+48.5, -1 ] ) cylinder( h = 1.5, r1 = 5, r2=3.2, $fn=6);  
    translate( [ offsx+7.65 , offsy , -1 ] ) cylinder( h = 1.5, r1 = 5, r2=3.2, $fn=6);  
    translate( [ offsx , offsy+48.5 , -1 ] ) cylinder( h = 1.5, r1 = 5, r2=3.2, $fn=6);  
    translate( [ 58.5 , 88 , -1 ] ) cylinder( h = 4, r = 3.2, $fn=30);   

    // door closing corners
    translate( [ 8 , 80 , 28 ] ) rotate([0,0,45]) cube( [ 5 , 5 , 10] ); 
    translate( [ 106 , 81 , 4 ] ) rotate([0,0,45]) cube( [ 5 , 5 , 40] ); 

    // inner edges cutout
    translate( [ 54 , 79.5 , 2 ] ) rotate([0,0,45]) cube( [ 5 , 5 , 50] ); 
    translate( [ 70 , 82.5 , 2 ] ) rotate([0,0,45]) cube( [ 5 , 5 , 50] ); 
    translate( [ 6 , 80 , 7 ] ) rotate([0,0,45]) cube( [ 5 , 5 , 24] ); 
    translate( [ 5.5 , 4 , 7 ] ) rotate([0,0,45]) cube( [ 3 , 5 , 29] ); 

    // x-axis cable hole
    translate( [ 89 , 2 , -1 ] ) cylinder( h = 10, r = 4, $fn=6);   
    //z-axis switch hole
    translate( [ 85.1 , 1.5 , -1 ] ) cylinder( h = 10, r = 2, $fn=6);
    
    translate( [ 80 , -5 , -1 ] ) cube( [ 15, 5, 10] ); 

    // large corner coutout
    translate( [ -27 , 80 , -54 ] ) rotate([50,0,45]) cube( [ 50, 50, 50] ); 
    translate( [ 137.5 , 60 , -10 ] ) rotate([0,0,45]) cube( [ 50, 50, 50] );
   
    //stress relief
    translate([-5,42,5])cube([10,1,25]);

}


// extruder cable holder
module ext_cable_holder()
{
difference()
{
    // body
    union(){
        rotate([90,0,0]) translate([-8, 26, -28-exo]) rotate([0,90,0]) cylinder( h = 4, r1 = 8, r2=11, $fn=6);    
        rotate([90,0,0]) translate([-4, 26, -28-exo]) rotate([0,90,0]) cylinder( h = 4, r1 = 11, r2=11, $fn=6);    
        rotate([90,0,0]) translate( [ 1.5 , 26, -28-exo ] ) rotate([0,90,0]) cylinder( h = 10, r1 = 13, r2=7.5, $fn=6);
        translate( [-4, 28+exo, 16.5 ] ) rotate([0,45,0]) cube( [ 6 , 5.5 , 7 ] );          
    }
    
    // upper cut
    translate( [ -15 , 13+exo , 15] ) cube( [ 15 , 15 , 25 ] );  
    // lower cut
    translate( [ 1.5 , 26+exo , 10] ) cube( [ 15 , 15 , 26 ] );  
 
    // ziptie holder
    difference(){
        rotate([90,0,0]) translate([-4, 26, -28-exo]) rotate([0,90,0]) cylinder( h = 3.5, r = 8.5,  $fn=30);    
        rotate([90,0,0]) translate([-5, 26, -28-exo]) rotate([0,90,0]) cylinder( h = 5.5, r = 6.2,  $fn=30);    
        }
}
}


module rambo_cover()
{
    ext_cable_holder();   
 
   difference(){
    main_body();
    cutouts();
    
    }
}

difference(){
    union(){
        // extruder cable filament holder body
        translate( [ 4.5 , 25.5+exo , 26 ] ) rotate([0,90,0]) cylinder( h = 7, r = 3.5, $fn=6);  
        translate( [ 4.5 , 22.5+exo , 22.5] ) cube( [ 7 , 3 , 7 ] );   
        translate( [ 4.5 , 23.5+exo , 20.8] ) cube( [ 7 , 2.5 , 7 ] );   
        translate( [ 4.5 , 24.7+exo , 26 ] ) rotate([0,90,0]) cylinder( h = 7, r = 3, $fn=30);   
        }
    // extruder filament inner hole
    translate( [ -5 , 25+exo , 26 ] ) rotate([0,90,0]) cylinder( h = 20, r = 1.75, $fn=30);   
    translate( [ 4, 25+exo , 26 ] ) rotate([0,90,0]) cylinder( h =3, r1 = 1.9, r2=1.75, $fn=30);   
}


// doors pin upper
translate( [ 2 , 85 , 31 ] ) cube( [ 6 , 7 , 4] ); 
translate( [ 4 , 88.5 , 35 ] ) cylinder( h = 3, r1=2.5, r2=1, $fn=30);  


difference(){

rambo_cover();
    
    // upper extruder cable opening
    translate( [ -5 , 28+exo , 26 ] ) rotate([0,90,-15]) cylinder( h = 20, r = 1.4, $fn=30);  
    
    // main hole
    translate( [ -10 , 28+exo , 26 ] ) rotate([0,90,0]) cylinder( h = 24, r = 5.5, $fn=30);   
    // cable opening slot
    translate( [ -15 , 26.5+exo , 30 ] ) cube( [ 30 , 3 , 10 ] ); 
    
    // flatten on door side 
    translate( [ -15 , 20+exo, 35 ] ) cube( [ 30 , 20 , 20 ] );  

    // opening slot cuts
    translate( [ -1.5 , 26+exo , 33] ) rotate([45,0,45]) cube( [ 3 , 3 , 3 ] );  
    translate( [ 1 , 28+exo , 33] ) rotate([45,0,45]) cube( [ 3 , 3 , 3 ] );  

    // screw body edge
    translate( [ 65 ,74.2 , 2] ) rotate([0,0,45]) cube( [ 10 , 10 , 50 ] );     
    
    // lightening slots
    translate( [ 98 ,22 , 2] ) cube( [ 5 , 34 , 5 ] );   
    translate( [ 98 ,71 , 2] ) cube( [ 5 , 13 , 5 ] );     
    translate( [ 3 ,20 , 2] ) cube( [ 4.5, 49 , 5 ] );     

    // bottom holes print supports
    translate( [ offsx+82.55 , offsy  ,0] ){
    translate( [ 0 , 0 , 2.5 ] ) cube([3.2,5.6,2], center=true);
    translate( [ 0 , 0 , 3 ] ) cube([3.2,3.8,2], center=true);
    }
    
    translate( [ offsx+82.55 , offsy+48.5 ,0] ){
    translate( [ 0 , 0 , 2.5 ] ) cube([3.2,5.6,2], center=true);
    translate( [ 0 , 0 , 3 ] ) cube([3.2,3.8,2], center=true);
    }

    translate( [ offsx+7.65 , offsy ,0] ){
    translate( [ 0 , 0 , 2.5 ] ) cube([3.2,5.6,2], center=true);
    translate( [ 0 , 0 , 3 ] ) cube([3.2,3.8,2], center=true);
    }

    translate( [ offsx , offsy+48.5 ,0] ){
    translate( [ 0 , 0 , 2.5 ] ) cube([3.2,5.6,2], center=true);
    translate( [ 0 , 0 , 3 ] ) cube([3.2,3.8,2], center=true);
    }

    translate( [ 58.5 , 88 ,0] ){
       intersection(){cylinder(r=3.2, h=10, $fn=30);
    translate( [ 0 , 0 , 2.5 ] ) cube([3.8,8,2], center=true);}
    translate( [ 0 , 0 , 3 ] ) cube([3.8,3.8,2], center=true);
    }


}
