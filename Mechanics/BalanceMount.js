const bottom = true;

const platformWidth = 20;
const platformLength = 40;
const platformHeight = 2;
const axisRadius = 4.2;
const axisHolderPos = bottom ? 3 : 8;
const platHoleRadius = bottom ? 0 : 5;

function main(params)
{
  const axisHolder = 
        CSG.cube({ 
                     radius: [ axisRadius+2*platformHeight, axisRadius+5*platformHeight, platformHeight/2 ]
                })
           .subtract(
                CSG.cylinder({
                     start: [0, 0, -platformHeight],
                     end: [0, 0, platformHeight], 
                     radiusStart: axisRadius,
                     radiusEnd: axisRadius
                })).rotateX(90);
   
  let platform = CSG.cube({ radius: [platformWidth, platformLength, platformHeight] });
  if(platHoleRadius) {
       platform = platform.subtract(CSG.cylinder({
                         start: [0, 0, -platformHeight],
                         end: [0, 0, platformHeight], 
                         radiusStart: platHoleRadius,
                         radiusEnd: platHoleRadius    
                      }));
  } 
  
  return  platform.union(axisHolder.translate([0, 
                                         -(platformLength-platformHeight-axisHolderPos),
                                         -(axisRadius+5.4*platformHeight)]))
                  .union(axisHolder.translate([0, 
                                         +(platformLength-platformHeight-axisHolderPos),
                                         -(axisRadius+5.4*platformHeight)]))
}
