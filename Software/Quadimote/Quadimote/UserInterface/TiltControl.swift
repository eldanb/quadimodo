
import SwiftUI
import Foundation
import Combine
import CoreMotion

class MotionManager: ObservableObject {
    
    private var motionManager: CMMotionManager
    private var timer: Timer?
    
    @Published
    var x: Double = 0.0
    @Published
    var y: Double = 0.0
    @Published
    var z: Double = 0.0
    
    static var instance = MotionManager()
    
    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.deviceMotionUpdateInterval = 1 / 20
        self.resume()
    }
    
    func suspend() {
        self.motionManager.stopDeviceMotionUpdates()
        timer?.invalidate()
        timer = nil
    }
    
    func resume() {
        self.motionManager.startDeviceMotionUpdates()
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(0.1),
                                     repeats: true) { _ in

            if let motionData = self.motionManager.deviceMotion {
                self.y = -motionData.attitude.pitch
                self.x = motionData.attitude.roll
            }
        }
    }
}

struct TiltControl : View {
    @State var tiltSensitivity: Double = 0.8

    
    @Binding var tiltX: Double
    @Binding var tiltY: Double
    
    struct Cross: Shape {
        var posX: CGFloat
        var posY: CGFloat
        
        func path(in rect: CGRect) -> Path {
            var p = Path()
            let size: CGFloat = CGFloat.minimum(rect.maxX, rect.maxY)
            
            p.addRoundedRect(in: CGRect(x: rect.midX - size/2 ,
                                        y: rect.midY-3,
                                        width: size,
                                        height: 5),
                             cornerSize: CGSize(width: 3, 
                                                height: 3))
            
            p.addRoundedRect(in: CGRect(x: rect.midX-3,
                                        y: rect.midY - size/2,
                                        width: 5,
                                        height: size),
                             cornerSize: CGSize(width: 3, 
                                                height: 3))
            
            p.addEllipse(in: CGRect(x: rect.midX-posX*size/2 - 10, 
                                    y: rect.midY-posY*size/2 - 10,
                                    width: 20,
                                    height: 20))
            
            return p
        }
    }
    
    public var body: some View {
        Cross(posX: CGFloat(tiltX),
              posY: CGFloat(tiltY))
            .onReceive(MotionManager.instance.$x, perform: { newVal in
                tiltY = -((newVal/tiltSensitivity).clamped(-1, 1).quantized(0.1))
            })
            .onReceive(MotionManager.instance.$y, perform: { newVal in
                tiltX = -((newVal/tiltSensitivity).clamped(-1, 1).quantized(0.1))
            })
    }
}
