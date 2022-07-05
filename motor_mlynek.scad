module mlynek_motor_holder()
{

    motor_d=24;
    motor_l=12;
    moror_pcb_h=10;
    motor_add=6;
    motor_bell=10;
    
    pcb_screw1_x=22.6;
    pcb_screw23_x= 7.0;
    pcb_screw23_y = 13.9;
    pcb_screw_h=5;
    pcb_screw_d=1.8;
    
    pcb_holder_move=-4;
    
    cube_x=13;
    cube_y=17;
    cube_z=20;
    
    bottom_d=45;
    
    
    difference()
    {
        union()
        {
            
            //pásek kolem motoru
            /*hull()
            {
                cylinder(d=motor_d+motor_add, h=motor_bell, $fn=120);
                translate([motor_d/2,-5,0])
                    cube([10,10,motor_bell]);
            }*/
            
            translate([0,0,motor_l-motor_bell])
            hull()
            {
                cylinder(d=motor_d+motor_add, h=motor_bell, $fn=120);
                translate([motor_d/2,-5,0])
                    cube([10,10,motor_bell]);
            }
            
            translate([0,0,pcb_holder_move])
            {
                //sloupky pro šroubky
                translate([0,0,motor_l+moror_pcb_h-pcb_screw_h])
                {
                    translate([-pcb_screw1_x,0,0])
                        cylinder(d=5,h=pcb_screw_h, $fn=60);

                    translate([-pcb_screw23_x,-pcb_screw23_y,0])
                        cylinder(d=5,h=pcb_screw_h, $fn=60);
                        
                    translate([-pcb_screw23_x,pcb_screw23_y,0])
                        cylinder(d=5,h=pcb_screw_h, $fn=60);                    
                        
                }
                
                //spojení 
                hull()
                {
                    translate([0,0,motor_l+moror_pcb_h-pcb_screw_h])
                    {
                        translate([-pcb_screw1_x,0,0])
                            cylinder(d=5,h=1, $fn=60);

                        translate([-pcb_screw23_x,-pcb_screw23_y,0])
                            cylinder(d=5,h=1, $fn=60);
                            
                        translate([-pcb_screw23_x,pcb_screw23_y,0])
                            cylinder(d=5,h=1, $fn=60);
                                            
                    }
                    
                    translate([-motor_d/2-cube_x/2,0,motor_l+0.5])
                            cube([cube_x,cube_y,1], center=true);                
                }
            }
            
            translate([-motor_d/2-cube_x/2,0,-cube_z/2+motor_l])
                        cube([cube_x,cube_y,cube_z], center=true);
                        
            translate([0,0,-cube_z+motor_l])
                       cylinder(d=bottom_d,h=5,$fn=120);
            
        }
        
        //motor
        translate([0,0,0.1*motor_l])
            cylinder(d=motor_d, h=2*motor_l, $fn=120);
        
        ////zářez
        translate([motor_d/2-0.5,-1,-0.005])
            cube([11,2,motor_l+0.01]);
            
        ////šroubky
        translate([0,0,pcb_holder_move])
        {
         translate([0,0,motor_l+moror_pcb_h-pcb_screw_h+2])
            {
                translate([-pcb_screw1_x,0,0])
                    cylinder(d=pcb_screw_d,h=pcb_screw_h+3,center=true, $fn=60);

                translate([-pcb_screw23_x,-pcb_screw23_y,0])
                    cylinder(d=pcb_screw_d,h=pcb_screw_h+3,center=true, $fn=60);
                    
                translate([-pcb_screw23_x,pcb_screw23_y,0])
                    cylinder(d=pcb_screw_d,h=pcb_screw_h+3,center=true, $fn=60);                    
                    
            }
        }
            
       ///šroubky na motoru
       for(z=[/*motor_bell/2,*/motor_l-motor_bell/2])       
       translate([motor_d/2+5,0,z])
       {
            rotate([90,0,0])
                cylinder(d=3.2, h=20,center=true, $fn=120);
            
            for(i=[-1,1])
            translate([0,i*15,0])
                rotate([90,0,0])
                    hull()
                    {
                        cylinder(d=8, h=20, center=true, $fn=120);
                        translate([10,0,0])
                            cylinder(d=8, h=20,center=true, $fn=120);
                    }
       }
       
       //dírka pro zemnění osy
       cylinder(d=5,h=100,$fn=120, center=true);
        
        
    
    }
    
    

}

mlynek_motor_holder();
color([1,0,0])
{
    cylinder(d=24,h=12.8,$fn=120);
    translate([0,0,0])
    cylinder(d=2,h=5.3+12.8,$fn=120);
}
