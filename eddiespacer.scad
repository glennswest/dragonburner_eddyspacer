
// Ears 44.5
// Fan = 10mm

module basespacer()
{
    import("/Volumes/homes/gwest/3dprint/db_spacer/base_spacer.stl");
}


module spacer_profile()
{
    projection(cut = false) basespacer();
}

module outer_body()
{
    translate([-28,-18,0]) cube([6,50,20]);
    translate([ 21,-18,0]) cube([6,50,20]);
    translate([-28,-18,0]) cube([49,50,1]);
    translate([-28,-18,0]) cube([49,10,20]);
    translate([-28+49/2-5+.5,-18-1+1,4-.2-2.8]) cube([10+6,20+2,4]);

}


module extruded_profile()
{
   linear_extrude(height = 20) spacer_profile();
   difference(){
      outer_body();
      translate([ -26+4,-18+5,-1]) cylinder(r=3.4/2,h=22,$fn=128);
      translate([ -26+1+49-3,-18+5,-1]) cylinder(r=3.4/2,h=22,$fn=128);
      
      translate([ -26+1+49-3-17+.5,-18+5+15,-1]) cylinder(r=4/2,h=22,$fn=128);
      translate([ -26+1+49-3-17+.5-10,-18+5+15,-1]) cylinder(r=4/2,h=22,$fn=128);
      
      translate([-28+49/2-5+.5,-18-1,4-.2-2.8+4]) cube([10+6,10+2,20]);
      }
}


module spacer()
{
   difference(){
      extruded_profile();
      translate([-7,48,19]) rotate([90,0,0]) cylinder(r=7/2,h=25,$fn=100);
      translate([ 6,48,19]) rotate([90,0,0]) cylinder(r=7/2,h=25,$fn=100);
     
      }

}


spacer();