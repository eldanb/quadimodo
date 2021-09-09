//
//  QuadimodoConnection.swift
//  Quadimote
//
//  Created by Eldan Ben Haim on 16/05/2021.
//

import Foundation
import Network

protocol QuadimodoCommand {
    func toData() -> Data
}

extension Data {
    mutating func append<T>(primitive: T) -> Void {
        Swift.withUnsafeBytes(of: primitive) {
            append($0.bindMemory(to: UInt8.self))
        }
    }
}

struct QuadimodoPIDControlCommand: QuadimodoCommand {
    let rollConfig: PidConfig
    let pitchConfig: PidConfig
    let yawConfig: PidConfig
    let throttleSetPoint: Int32

    func toData() -> Data {
        var d = Data()
        
        d.append(contentsOf: [2, 0, 0, 0])
        d.append(primitive: throttleSetPoint)
        d.append(rollConfig.data)
        d.append(pitchConfig.data)
        d.append(yawConfig.data)
        
        return d
    }
}



struct QuadimodoOffCommand: QuadimodoCommand {
    func toData() -> Data {
        var d = Data()
        
        d.append(contentsOf: [1, 0, 0, 0])
        d.append(primitive: Int32(0))
        d.append(primitive: Int32(0))
        d.append(primitive: Int32(0))
        d.append(primitive: Int32(0))
        
        return d
    }
}


struct QuadimodoRecalibrateCommand: QuadimodoCommand {
    func toData() -> Data {
        var d = Data()
        
        
        d.append(contentsOf: [3, 0, 0, 0])
        
        return d
    }
}


protocol QuadimodoConnection {
    func send(_ command: QuadimodoCommand)
    var name: String { get }
}

class QuadimodoUdpConnection : QuadimodoConnection {
    var connection: NWConnection
    var name: String
    
    init(endpoint: NWEndpoint, name: String) {
        let params = NWParameters.udp
        params.serviceClass = .interactiveVideo
        params.requiredInterfaceType = .wifi
        connection = NWConnection(to: endpoint, using: params)        
        connection.start(queue: .main)
        
        self.name = name
    }
    
    deinit {
        connection.forceCancel()
    }
    
    func send(_ command: QuadimodoCommand) {
        NSLog("%@", "\(command)")
        connection.send(content: command.toData(),
                        isComplete: true,
                        completion: NWConnection.SendCompletion.contentProcessed({ err in
                            
                        }))
    }
}

struct MockQuadimodoConnection : QuadimodoConnection {
    func send(_ command: QuadimodoCommand) {
        print(command)
    }
    
    var name: String { get { return "mock" } }
}
