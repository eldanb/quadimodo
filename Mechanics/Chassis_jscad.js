const motorRadius = 4;
const gearBoxRadius = 5;
const gearBoxNotchSize = 2;
const motorHolderWallThick = 1.5;
const motorHolderHeight = 10;

const chassisLen = 150;
const chassisWidth = 6;
const chassisThick = 2.3;
const motorArmThick = 5;

const circuitWidth = 72;
const circuitLength = 38;
const circuitHolderHeight = 8;


function cross(l, w, midw) {
	 midw ||= w;
    const crosspoly = CAG.fromPoints([
			[-w/2, -l/2],
			[-midw/2, 0],
			[-w/2, l/2],
			[w/2, l/2],
			[midw/2, 0],
			[w/2, -l/2]]);
	 const extrudedPoly = 
	      crosspoly.extrude({offset: [0, 0, chassisThick]})
	           .translate([0, 0, -chassisThick/2]);

	 return extrudedPoly.union( extrudedPoly.rotateZ(90));
}

function tube(innerRadius, wallThickness, startZ, endZ) {
    return CSG.cylinder({ 
        radius: innerRadius+wallThickness, 
        start: [0, 0, startZ],
        end: [0, 0, endZ]
    }).subtract(CSG.cylinder({ 
        radius: innerRadius, 
        start: [0, 0, startZ],
        end: [0, 0, endZ]
    }))
}

function motorHolder() {
    return tube(
					motorRadius, 
					motorHolderWallThick, 
					-chassisThick/2,
					motorHolderHeight
				).union(
				cross(motorRadius*2, 2)
				).rotateZ(45);
}

function gearedMotorHolder() {
    return tube(
					motorRadius+0.1, 
					motorHolderWallThick, 
					-chassisThick/2,
					motorHolderHeight/2
				).union(
				   tube(
					   gearBoxRadius+0.1, 
					   motorHolderWallThick, 
					   motorHolderHeight/2,
					   motorHolderHeight
				   ).subtract(
				      CSG.cube({ corner1: [gearBoxRadius, -gearBoxNotchSize/2, motorHolderHeight/2],
									   corner2: [gearBoxRadius + motorHolderWallThick + 0.2, gearBoxNotchSize/2, motorHolderHeight]
									})			         
				   )
				);
}


function chassis() {
    const chassisCross = 
       cross(chassisLen, chassisWidth, chassisWidth*3)
 			.subtract(cross(chassisLen-motorArmThick, chassisWidth-motorArmThick, chassisWidth*3-motorArmThick));
        
    const circuitHolder = CSG.cube({
        radius: [circuitWidth/2+motorHolderWallThick, circuitLength/2+motorHolderWallThick,  circuitHolderHeight/2]
    }).subtract(
        CSG.cube({
            radius: [circuitWidth/2, circuitLength/2, circuitHolderHeight/2 ]
        }).translate([0, 0, chassisThick])
    ).translate([0, 0, (circuitHolderHeight)/2-chassisThick/2])
     .rotateZ(45);
            
    return chassisCross.union(circuitHolder).subtract(CSG.cylinder({
        radius: motorRadius*1.5, 
        start: [0, 0, -chassisThick/2],
        end:[0, 0, chassisThick/2]})
        ).union(cross(3*motorRadius, 1));
}

function main() {
/*
    let part = chassis();
    for(let i=0; i<4; i++) {
        part = part.union(gearedMotorHolder().translate([chassisLen/2 + motorRadius, 0, 0]).rotateZ(i*90))
    }

    return part;*/
return gearedMotorHolder();
}


