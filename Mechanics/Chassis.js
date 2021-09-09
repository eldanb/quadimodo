const motorRadius = 4.0;
const motorHolderWallThick = 1;
const motorHolderHeight = 10;

const chassisLen = 100;
const chassisWidth = 6;
const chassisThick = 2.3;

const circuitWidth = 70;
const circuitLength = 36;
const circuitHolderHeight = 8;


function cross(l, w) {
    return union([
            translate([-l/2, -w/2, 0], 
                      cube([l, 
                            w, 
                            chassisThick])),

            translate([-w/2, -l/2, 0], 
                      cube([w,
                            l, 
                            chassisThick]))
    ]);
}

function motorHolder() {
    return rotate([0, 0, 45],
              union(
                difference(
                    cylinder({ r: motorRadius+motorHolderWallThick, 
                               h: motorHolderHeight}),
                    cylinder({ r: motorRadius, 
                               h: motorHolderHeight})
                ),
                cross(motorRadius*2, 2)
            )
    );
}

function chassis() {
    const chassisCross = 
        cross(chassisLen, chassisWidth);
        
    const circuitHolder = rotate([0, 0, 45],
        translate([-circuitWidth/2-motorHolderWallThick,
                  -circuitLength/2-motorHolderWallThick, 
                  0],
            difference(
                cube([circuitWidth+motorHolderWallThick*2, 
                      circuitLength+motorHolderWallThick*2, 
                      circuitHolderHeight
                      ]),
                translate([motorHolderWallThick, 
                           motorHolderWallThick, 
                           chassisThick],
                    cube([circuitWidth, 
                          circuitLength, 
                          circuitHolderHeight
                        ]))
            )));
            
    return union(
        difference(
            union(chassisCross, circuitHolder),    
            cylinder({r: motorRadius*1.5, h: chassisThick})
        ),
        cross(3*motorRadius, 1)
    );    
}


function main() {
    let parts = [chassis()];
    for(let i=0; i<4; i++) {
        parts.push(rotate([0, 0, i*90],
            translate([chassisLen/2 + motorRadius, 0, 0], 
                motorHolder()
            )
        ))
    }
    return union(parts);
}
