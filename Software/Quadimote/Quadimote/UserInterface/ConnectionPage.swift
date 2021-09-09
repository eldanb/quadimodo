//
//  ConnectionPage.swift
//  Quadimote
//
//  Created by Eldan Ben Haim on 28/05/2021.
//

import Foundation
import SwiftUI
import Network

struct ConnectionPage: View {
    @Binding var remoteState: QuadimodoRemoteState?
    @Binding var quadcopterAddress: String;
    @ObservedObject var drones: QuadimodoAdvertisedDrones
        
    var body: some View {
        VStack {
            Text("Connect to Quadcopter")
                .font(.title2)
                .padding(.vertical, 24)
                        
            VStack(alignment: .leading) {
                Text("Detected Vehicles")
                    .font(.headline)
                List(drones.knownDrones, rowContent: { (drone: AdvertisedDrone) in
                    HStack {
                        Text(drone.droneName)
                        Spacer()
                        VStack(alignment:.trailing) {
                            Text(drone.host.debugDescription)
                                .font(.system(.footnote))
                                .foregroundColor(Color(.gray))
                            Text("v\(drone.firmwareVersion)")
                                .font(.system(.footnote))
                                .foregroundColor(Color(.gray))
                        }
                            
                    }
                    .contentShape(Rectangle())
                    .onTapGesture(perform: connectTo(drone.host, name: drone.droneName))
                }).frame(height: CGFloat(drones.knownDrones.count * 48))
                
            }.padding(.bottom, 24)

            VStack(alignment: .leading) {
                Text("Manual Connection")
                    .font(.headline)
                HStack {
                    TextField("", text: $quadcopterAddress)
                        .padding(3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray)
                        )
                    
                    Button(action: connectTo(NWEndpoint.Host(quadcopterAddress), name: quadcopterAddress)) {
                        Text("Connect")
                    }.padding(8)
                }
            }
            
            Spacer()
        }.padding(.horizontal, 16)
    }
    
    func connectTo(_ whereTo: NWEndpoint.Host, name: String) -> () -> Void {
        {
            withAnimation {
                let conn = QuadimodoUdpConnection(
                    endpoint: NWEndpoint.hostPort(
                        host: whereTo,
                        port: 4567),
                    name: name)
                
                let defaultConfigData = UserDefaults.standard.data(forKey: "defaultConfig")
                let config = (try? NSKeyedUnarchiver.unarchivedObject(ofClass: QuadimodoRemoteConfig.self,
                                                                      from: defaultConfigData ?? Data())) ?? QuadimodoRemoteConfig()
                
                remoteState = QuadimodoRemoteState(config: config,
                                                   connection: conn)
            }
        }
    }
}

struct ConnectionPage_Previews: PreviewProvider {
    @State static var remoteState: QuadimodoRemoteState? = nil
    @State static var addr: String = ""
    
    static var droneOne = AdvertisedDrone(
        name: "D1",
        version: 1,
        host: NWEndpoint.Host("meh1"))
    
    static var droneTwo = AdvertisedDrone(
        name: "D2",
        version: 1,
        host: NWEndpoint.Host("meh2"))
    
    
    static var mockDrones = QuadimodoAdvertisedDrones(withKnownDrones:  [droneOne, droneTwo, droneOne])

    static var previews: some View {
        ConnectionPage(remoteState: $remoteState, quadcopterAddress: $addr, drones: mockDrones)
    }
}
