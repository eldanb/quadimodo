//
//  QuadimodoAdvertisedDrones.swift
//  Quadimote
//
//  Created by Eldan Ben Haim on 08/09/2021.
//

import Foundation
import SwiftUI
import Network

public struct AdvertisedDrone : Identifiable {
    
    var droneName: String
    var firmwareVersion: Int32
    var host: NWEndpoint.Host
    
    init?(withPacket: Data) {
        let packetType: Int32 = withPacket.withUnsafeBytes { $0.bindMemory(to: Int32.self)[0] }
        if(packetType == 8) {
            firmwareVersion = withPacket.withUnsafeBytes { $0.bindMemory(to: Int32.self)[1] }
            host = NWEndpoint.Host.ipv4(IPv4Address.init(withPacket.subdata(in: 8..<12))!)
            droneName = String(data: withPacket.subdata(in: 12..<28), encoding: .ascii)!
        } else {
            return nil
        }
    }
    
    init(name: String, version: Int32, host: NWEndpoint.Host) {
        droneName = name
        firmwareVersion = version
        self.host = host
    }
    
    public var id: NWEndpoint.Host { get { host } }

}

public class QuadimodoAdvertisedDrones : ObservableObject {
    @Published
    public var knownDrones: [AdvertisedDrone] = []
    
    public var listener: NWListener?
    
    init() throws {
        if let nlistener = try? NWListener(using: .udp, on: 4567) {
            listener = nlistener
            nlistener.newConnectionHandler = { newConnection in
                newConnection.stateUpdateHandler = { newState in
                    if(newState == .ready) {
                        newConnection.receiveMessage{ (newData, context, b, error) in
                            if let newDrone = AdvertisedDrone(withPacket: newData!) {
                                var newCollection = self.knownDrones.filter({$0.host != newDrone.host})
                                newCollection.append(newDrone)
                                newCollection.sort { d1, d2 in
                                    d1.droneName < d2.droneName
                                }
                                
                                self.knownDrones = newCollection
                            }
                            newConnection.forceCancel()
                        }
                    }
                }
                newConnection.start(queue: DispatchQueue.main)

            }
            
            nlistener.start(queue: DispatchQueue.main)
        }
    }
    
    init(withKnownDrones drones: [AdvertisedDrone]) {
        knownDrones = drones
    }
}
