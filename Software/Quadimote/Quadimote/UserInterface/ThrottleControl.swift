import SwiftUI
import Foundation
import Combine

public struct ThrottleControl: View {
    @Binding var throttleValueX: Double
    var throttleRangeX: ClosedRange<Double>
    
    @Binding var throttleValueY: Double
    var throttleRangeY: ClosedRange<Double>
    
    var horizontal: Bool
    var vertical: Bool
    
    struct ThrottleShape: Shape {
        var posX: CGFloat
        var posY: CGFloat
        
        var horizontal: Bool
        var vertical: Bool
        func path(in rect: CGRect) -> Path {
            var p = Path()
            
            if(horizontal) {
                p.addRoundedRect(in: CGRect(x: rect.minX,
                                            y: rect.midY-3,
                                            width: rect.size.width,
                                            height: 5),
                                 cornerSize: CGSize(width: 3,
                                                    height: 3))
            }
            
            if(vertical) {
                p.addRoundedRect(in: CGRect(x: rect.midX-3,
                                            y: rect.minY,
                                            width: 5,
                                            height: rect.size.height),
                                 cornerSize: CGSize(width: 3,
                                                    height: 3))
                
            }

            p.addEllipse(in: CGRect(x: rect.maxX - 20 - posX*(rect.size.width-20),
                                    y: rect.maxY - 20 - posY*(rect.size.height-20),
                                    width: 20,
                                    height: 20))
            return p
        }
    }
    
    public var body: some View {
        GeometryReader { controlRect in 
            ThrottleShape(posX: CGFloat((throttleValueX - throttleRangeX.lowerBound) / (throttleRangeX.upperBound - throttleRangeX.lowerBound)),
                          posY: CGFloat((throttleValueY - throttleRangeY.lowerBound) / (throttleRangeY.upperBound - throttleRangeY.lowerBound)),
                          horizontal: horizontal,
                          vertical: vertical)
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: CoordinateSpace.local)
                            .onChanged { dragActionValue in
                                if(horizontal) {
                                    let relPosX = Double(dragActionValue.location.x / controlRect.size.width)
                                    throttleValueX = ((1-relPosX).clamped(0, 1) *
                                                        (throttleRangeX.upperBound - throttleRangeX.lowerBound) + throttleRangeX.lowerBound)
                                } else {
                                    throttleValueX = 0
                                }
                                
                                if(vertical) {
                                    let relPosY = Double(dragActionValue.location.y / controlRect.size.height)
                                    throttleValueY = ((1-relPosY).clamped(0, 1) *
                                                        (throttleRangeY.upperBound - throttleRangeY.lowerBound) + throttleRangeY.lowerBound)
                                }
                            }
                            .onEnded { _ in
                                withAnimation(.easeIn(duration: 0.5)) {
                                    throttleValueX = 0
                                    throttleValueY = 0
                                }
                            })
        }
    }
}
