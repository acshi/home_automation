clear = 0.4;
ac_top_l = 3/4*25.4 + clear;
ac_h = (1+3/32)*25.4 + clear;
ac_t1 = 0.2*25.4;
ac_t2 = 19.8;
ac_depth = ac_t1 + ac_t2;
ac_offset_y = (1+.5+1/32)*25.4;
ac_t_ext = 0*5;
radius = 17 + clear;

module ac_socket_single() {
    t = ac_t1 + ac_t2 + ac_t_ext;
    translate([0, 0, -ac_t_ext])
        cube([ac_top_l, ac_h, t]);
    translate([ac_top_l/2, ac_h/2, -ac_t_ext])
        render() intersection() {
            cylinder(r = radius, h = t);
            cube([ac_top_l*10, ac_h, t*2], center = true);
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

module ac_socket(screws=true) {
    ac_socket_single();
    to_center_y = ac_offset_y-(ac_offset_y-ac_h)/2;
    difference() {
        translate([ac_top_l/2-15, -1.5, 0])
            cube([30, 47, ac_t2]);
        if (screws) {
            translate([ac_top_l/2, to_center_y, 0]) {
                translate([0, 0, ac_t2/2])
                    #cylinder(r=2, h=ac_t2/2);
                translate([0, 0, ac_t2-1])
                    #cylinder(r=3, h=1);
            }
        }
    }
    difference() {
        translate([ac_top_l/2-17, -20.5, ac_t2])
            cube([34, 20.5, 0.5]);
        if (screws) {
            translate([ac_top_l/2, to_center_y-42, ac_t2-0.01])
                #slot(r=2, l=6, h=1);
            translate([ac_top_l/2-11, to_center_y-46.2, ac_t2])
                #cylinder(r=2.5, h=1);
            translate([ac_top_l/2+11, to_center_y-46.2, ac_t2])
                #cylinder(r=2.5, h=1);
        }
    }
    difference() {
        translate([ac_top_l/2-17, 2*to_center_y, ac_t2])
            cube([34, 20.5, 0.5]);
        if (screws) {
            translate([ac_top_l/2, to_center_y+42, ac_t2-0.01])
                #slot(r=2, l=6, h=1);
            translate([ac_top_l/2-11, to_center_y+46.2, ac_t2])
                #cylinder(r=2.5, h=1);
            translate([ac_top_l/2+11, to_center_y+46.2, ac_t2])
                #cylinder(r=2.5, h=1);
        }
    }
    translate([0, ac_offset_y, 0])
        ac_socket_single();
    translate([ac_top_l/2, to_center_y, 0]) {
        //cylinder(r=3, h=ac_t1);
        translate([0, 0, ac_t1])
            cylinder(r=2, h=ac_t_ext);
        *translate([0, 40, 0]) {
            slot(r=2.5, l=7, h=ac_t1);
            translate([0, 0, ac_t1])
                cylinder(r=2, h=ac_t_ext);
        }
        *translate([0, -40, 0]) {
            slot(r=2.5, l=7, h=ac_t1);
            translate([0, 0, ac_t1])
                cylinder(r=2, h=ac_t_ext);
        }
    }
}

module trapezoid(width1, width2, height, thickness, shape=0) {
    diff_w = width1 - width2;
    linear_extrude(thickness) polygon([[0, 0], [(1+shape)* diff_w/2, height],
                                       [(1+shape)* diff_w/2 + width2, height], [width1, 0]]);
}

wall_t = 4;
case_w = 80;
case_h = 140;
latch_w = 20;
latch_w1 = 30;
latch_w2 = 15;
latch_h = 8;
latch_y = 8;
latch_t = 4;
latch_reach = 52;

module latch() {
    knib_h = latch_h;
    knib_l = wall_t;
    knib_end_h = 2;
    t = wall_t;
    rotate([-90, 0, 0])
        trapezoid(latch_w1, latch_w2, latch_reach, t);
    translate([latch_w1-latch_w2/2, 0, -latch_reach+knib_h])
    rotate([0, 90, 180])
        trapezoid(knib_h, knib_end_h, knib_l, latch_w2, -0.5);
}

module case_top() {
    case_t = 30;
    clear = 0.3;
    render() difference() {
        render() difference() {
            cube([case_w, case_h, case_t]);
            translate([wall_t, wall_t, 0])
                cube([case_w-2*wall_t, case_h-2*wall_t, case_t-wall_t]);
            translate([wall_t/2-clear, wall_t/2-clear, 0])
                    difference() {
                        cube([case_w-wall_t+clear*2, case_h-wall_t+clear*2, wall_t]);
                        translate([wall_t/2+clear*2, wall_t/2+clear*2, 0])
                            cube([case_w-wall_t*2-clear*2, case_h-wall_t*2-clear*2, wall_t]);
                    }
        }
        translate([case_w/2-ac_top_l/2, case_h/2-ac_h/2-ac_offset_y/2, case_t - ac_depth + 0.001])
            ac_socket(false);
        translate([case_w/2, case_h/2, case_t-wall_t])
            cylinder(r=2, h=wall_t);
        translate([case_w/2, case_h/2, case_t-wall_t/2])
            cylinder(r=4, h=wall_t/2);
    }
    translate([case_w/2-latch_w1/2, latch_t, case_t])
            latch();
    translate([case_w/2+latch_w1/2, case_h-latch_t, case_t])
        rotate([0, 0, 180])
        latch();
}

spacer_t = 14;
module screw_spacer(spacer_r=6.5) {
    hole_h = 8;
    render() difference() {
        cylinder(r=spacer_r, h=spacer_t);
        translate([0, 0, spacer_t-hole_h])
            cylinder(r=2, h=hole_h);
    }
}

module case_bottom() {
    case_t = 34;
    clear = 0.6;
    in_wall_t = 2.4;
    difference() {
        union() {
            render() difference() {
                    cube([case_w, case_h, case_t]);
                translate([wall_t, wall_t, wall_t])
                    cube([case_w-2*wall_t, case_h-2*wall_t, case_t]);
                translate([case_w/2-latch_w/2, 0, latch_y])
                    cube([latch_w, wall_t, latch_h]);
                translate([case_w/2-latch_w/2, case_h-wall_t, latch_y])
                    cube([latch_w, wall_t, latch_h]);
                translate([0, 0, case_t-wall_t])
                    difference() {
                        cube([case_w, case_h, wall_t]);
                        translate([wall_t/2, wall_t/2, 0])
                            cube([case_w-wall_t, case_h-wall_t, wall_t]);
                    }
                translate([10-clear, 108-clear, 0])
                    cube([58.5+clear*2, 17+clear*2, 20]);
            }
            translate([13.4, 3.6 + case_h/2 - 84.455/2 - 12, 0]) {
                translate([0, 0, 0])
                    screw_spacer();
                translate([53.34, 0, 0])
                    screw_spacer();
                translate([0, 76.835+1, 0])
                    screw_spacer(4.5);
                translate([53.34, 76.835, 0])
                    screw_spacer(5.5);
            }
            render() translate([10, 108, 0]) difference() {
                translate([-in_wall_t-clear, -in_wall_t-clear, 0])
                    cube([58.5+in_wall_t*2+clear*2, 17+in_wall_t*2+clear*2, 20+in_wall_t+clear]);
                translate([-clear, -clear, 0])
                    cube([58.5+clear*2, 17+clear*2, 20]);
                translate([12, 17/2, 20])
                    cylinder(r=2, h=in_wall_t+clear);
                translate([12+34.5, 17/2, 20])
                    cylinder(r=2, h=in_wall_t+clear);
                translate([1.6, 17/2, 20])
                    cylinder(r=1.25, h=in_wall_t+clear);
                translate([1.6+55.3, 17/2, 20])
                    cylinder(r=1.25, h=in_wall_t+clear);
                translate([56.2, 0.5, 20])
                    cylinder(r=1.25, h=in_wall_t+clear);
            }
        }
    }
}

//ac_socket();
case_top();

*translate([0, 0, -30-0]) {
    case_bottom();

    translate([10, case_h/2 - 84.455/2 - 12, 1+spacer_t])
    rotate([0, 0, 90]) {
        translate([-101, 83, 0])
            %import("circuit.stl");
        translate([25.8, -41, 1])
            #cube([12.7, 29, 15.7]);
        translate([9.4, -41, 1])
            #cube([12.7, 29, 15.7]);
        translate([45.5, -56.6, -9])
            #cube([17, 43, 9]);
    }
    *translate([10, 108, 0])
            #cube([58.5, 17, 20]);
}
