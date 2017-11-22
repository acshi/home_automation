clear = 0.4;
top_l = 3/4*25.4 + clear;
h = (1+3/32)*25.4 + clear;
t = 3/16*25.4;
radius = 17 + clear;

module ac_socket_single() {
    cube([top_l, h, t]);
    translate([top_l/2, h/2, 0])
        render() intersection() {
            cylinder(r = radius, h = t);
            cube([top_l*10, h, t*2], center = true);
        }
}

module slot(r, l, h) {
    difference() {
        union() {
            translate([-l/2, -r]) cube([l, r*2, h]);
            translate([l/2, 0]) cylinder(r = r, h = h);
            translate([-l/2, 0]) cylinder(r = r, h = h);
        }
    }
}

module ac_socket() {
    offset_y = (1+.5+1/32)*25.4;
    ac_socket_single();
    translate([0, offset_y, 0])
        ac_socket_single();
    translate([top_l/2, offset_y-(offset_y-h)/2, -t]) {
        cylinder(r=3, h=t);
        translate([0, 40, 0])
            #slot(r=2.5, l=7, h=t);
        translate([0, -40, 0])
            slot(r=2.5, l=7, h=t);
    }
}   

ac_socket();