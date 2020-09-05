/*
Modules to generate Koch snowflake and Sierpinski carpet

Copyright (C) 2019 Sam Hartburn

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
    
You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

author: Sam Hartburn
email: sam@samhartburn.co.uk
website: www.samhartburn.co.uk
*/

module koch_snowflake(levels,rad,height,x,y) {
    
    cylinder(height,rad,rad,center=true,$fn=3);
    
    if (levels>0) {
        for (i=[1:levels+1]) {
            //echo(levels);
        
            for (j=[0:5]) {
                rotate([0,0,j*60]) {
                    translate([2*rad/3,0,0]) {
                        koch_snowflake(levels-1,rad/(pow(3,i)),height,0,2*rad/3);
                    }
                }
            }
        }
    }
}

module sierpinski_carpet(levels, radius, height, x, y) {
    rad_sq = 2*radius;
    hole_height = height+2;
    translate([x,y,0]) {
        difference() {
            cube([rad_sq,height,rad_sq], center=true);
            _sierpinski_carpet(levels, rad_sq, hole_height, 0, 0);
        }
    }
}

module _sierpinski_carpet(levels, rad, height, x, y) {
    if (levels>0) {
        this_level=levels-1;
        rad_sq = rad/3;
        translate([x,0,y]) {
            cube([rad_sq,height,rad_sq], center=true);
            if (this_level>0) {
                _sierpinski_carpet(this_level, rad_sq, height, -rad_sq,-rad_sq);
                _sierpinski_carpet(this_level, rad_sq, height, -rad_sq,rad_sq);
                _sierpinski_carpet(this_level, rad_sq, height, rad_sq,-rad_sq);
                _sierpinski_carpet(this_level, rad_sq, height, rad_sq,rad_sq);
                _sierpinski_carpet(this_level, rad_sq, height, 0,-rad_sq);
                _sierpinski_carpet(this_level, rad_sq, height, -rad_sq,0);
                _sierpinski_carpet(this_level, rad_sq, height, 0,rad_sq);
                _sierpinski_carpet(this_level, rad_sq, height, rad_sq,0);
                
            }
        }
    }
}