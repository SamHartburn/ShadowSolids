/*
Generates a carpeted hexaflake - a solid with othogonal profiles of hexagon, Sierpinski carpet and Koch snowflake

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

use <Fractals.scad>;

$fn=256;

//Set radius of circular cross section
radius = 15;

//Levels of iteration for carpet and snowflake
//3 of one and 2 of the others seems to be the maximum OpenSCAD can cope with
levels_snowflake = 2;
levels_carpet = 3;


intersection() {
    
    //Hexagon
    rotate([30,0,0]) {
        rotate([0,-90,0]) {
            cylinder(2*radius,radius,radius,center=true,$fn=6);
        }
    }
             
    //Snowflake
    rotate([90,0,0]) {
        koch_snowflake(levels_snowflake,radius,2*radius,0,0);
    }
    
    //Sierpinski carpet
    rotate([90,0,0]) {
        sierpinski_carpet(levels_carpet, radius, 2*radius, 0,0);
    }
}    
 



