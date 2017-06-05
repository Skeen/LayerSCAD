$fn=64;
use <gear.scad>;
use <layer.scad>;

show_layer="1mm";

// Number of teeth
num_teeth    = 14;
// Circular pitch
mm_per_tooth = 2;
// Height
thickness    = 4.5;
// Square peg size
peg          = 3;
// Top cut
top_radius   = 3;
top_depth    = 1;
// OpenSCAD render clutter
ct           = 0.1;

// Outer radius circle
//%circle(r=5);
// Inner radius circle
//%circle(r=4);

layer("cut-through")
{
    difference()
    {
        projection()
        {
            gear(mm_per_tooth, num_teeth, thickness, 0);
        }

        // Cut out the square peg
        square([peg,peg], center=true);
    }
}

// Cut
layer("1mm")
{
    circle(r=top_radius, center=true);
}
