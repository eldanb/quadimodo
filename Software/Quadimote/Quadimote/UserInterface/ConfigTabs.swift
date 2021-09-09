//
//  RemoteTabs.swift
//  Quadimote
//
//  Created by Eldan Ben Haim on 28/05/2021.
//

import Foundation
import SwiftUI

struct ConfigTabs: View {
    @ObservedObject var remoteConfig: QuadimodoRemoteConfig
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    PidConfigControl(title: "Pitch PID",
                                     pMax: 100000,
                                     iMax: 200,
                                     dMax: 100000000,
                                     sMax: 16000,
                                     value: $remoteConfig.pitchPid)
                        .padding(16)
                        .tabItem { Text("PConfig") }

                    PidConfigControl(title: "Roll PID",
                                     pMax: 100000,
                                     iMax: 200,
                                     dMax: 100000000,
                                     sMax: 16000,
                                     value: $remoteConfig.rollPid)
                        .padding(16)
                        .tabItem { Text("RConfig") }

                    PidConfigControl(title: "Yaw PID",
                                     pMax: 200,
                                     iMax: 200,
                                     dMax: 200,
                                     sMax: 200,
                                     value: $remoteConfig.yawPid)
                        .padding(16)
                        .tabItem { Text("YConfig") }
                }.tabViewStyle(PageTabViewStyle())
                 .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }.padding(8)
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarItems(
                trailing: Button(
                    action: {
                        do {
                            let configData = try NSKeyedArchiver.archivedData(withRootObject: remoteConfig,
                                                                              requiringSecureCoding: true)
                            UserDefaults.standard.set(configData, forKey: "defaultConfig")
                        } catch {
                            print("Unexpected error: \(error).")
                        }
                        withAnimation {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        Text("Save")
                    })
        }
    }
}

struct ConfigTabs_Previews: PreviewProvider {
    @ObservedObject static var remoteConfig: QuadimodoRemoteConfig = QuadimodoRemoteConfig()

    static var previews: some View {
        ConfigTabs(remoteConfig: remoteConfig)
    }
}
