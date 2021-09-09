
import SwiftUI
public class QuadimodoRemoteState : ObservableObject {
    @Published
    public var yaw: Double = 0 {
        didSet {
            if(oldValue != yaw) {
                sendPidCommand()
            }
        }
    }
    
    @Published
    public var pitch: Double = 0 {
        didSet {
            if(oldValue != pitch) {
                sendPidCommand()
            }
        }
    }
    
    @Published
    public var roll: Double = 0 {
        didSet {
            if(oldValue != roll) {
                sendPidCommand()
            }
        }
    }
    
    @Published
    public var throttle: Double = 0 {
        didSet {
            if(oldValue != throttle) {
                sendPidCommand()
            }
        }
    }
    
    let config: QuadimodoRemoteConfig
    let connection: QuadimodoConnection
    
    init(config: QuadimodoRemoteConfig, connection: QuadimodoConnection) {
        self.connection = connection
        self.config = config
    }

    func recalibrate() {
        let cmd = QuadimodoRecalibrateCommand()
        connection.send(cmd)
    }
    
    private func sendPidCommand() {
        if(throttle != 0) {
            let cmd = QuadimodoPIDControlCommand(rollConfig: config.rollPid.withSetpointScaledBy(scale: roll),
                                                 pitchConfig: config.pitchPid.withSetpointScaledBy(scale: pitch),
                                                 yawConfig: config.yawPid.withSetpointScaledBy(scale: yaw),
                                                 throttleSetPoint: Int32(throttle))
            connection.send(cmd)
        } else {
            connection.send(QuadimodoOffCommand())
        }
    }
}
