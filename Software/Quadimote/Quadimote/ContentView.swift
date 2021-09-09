//
//  ContentView.swift
//  Quadimote
//
//  Created by Eldan Ben Haim on 16/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State var remoteState: QuadimodoRemoteState?
    @State var quadcopterAddress: String = "192.168.1.200"
    @State var knownDrones = (try? QuadimodoAdvertisedDrones()) ?? QuadimodoAdvertisedDrones(withKnownDrones: [])
    
    var body: some View {
        if let remoteState = remoteState {
            RemotePage(remoteState: remoteState,
                       remoteConfig: remoteState.config,
                       remoteStateBinding: $remoteState)
        } else {
            ConnectionPage(remoteState: $remoteState, quadcopterAddress: $quadcopterAddress, drones: knownDrones)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
