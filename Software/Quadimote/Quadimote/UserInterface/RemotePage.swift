import SwiftUI
import Foundation
import Combine
import CoreMotion

public struct RemotePage: View {
    @ObservedObject var remoteState: QuadimodoRemoteState
    @ObservedObject var remoteConfig: QuadimodoRemoteConfig
    @Binding var remoteStateBinding: QuadimodoRemoteState?
    
    @State var dummy: Double = 0
    @State var settingsPresented: Bool = false
    @State var useTilt = false;

    public var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: VerticalAlignment.center) {
                    
                    ThrottleControl(throttleValueX: $remoteState.yaw,
                                    throttleRangeX: -1...1,
                                    throttleValueY: $remoteState.throttle,
                                    throttleRangeY: 0...1000,
                                    horizontal: true,
                                    vertical: true)
                        .frame(width: 150, height: 150)

                    Spacer()

                    if(useTilt) {
                        TiltControl(tiltX: $remoteState.roll,
                                    tiltY: $remoteState.pitch)
                            .frame(width: 150, height: 150)
                    } else {
                        ThrottleControl(throttleValueX: $remoteState.roll,
                                        throttleRangeX: -1...1,
                                        throttleValueY: $remoteState.pitch,
                                        throttleRangeY: -1...1,
                                        horizontal: true,
                                        vertical: true)
                            .frame(width: 150, height: 150)
                    }

                    VStack {
                        
                        Spacer()
                        
                        Button(action: {
                            useTilt = !useTilt
                        }) {
                            Image(systemName: "move.3d")
                                .imageScale(.large)
                                .padding(4)
                                .cornerRadius(3.0)
                                .background( useTilt ? Color(.secondarySystemBackground) : nil )
                        }

                        Spacer()
                        
                        Button(action: {
                            remoteState.recalibrate()
                        }) {
                            Image(systemName: "plus.viewfinder").imageScale(.large)
                        }
                        
                        Spacer()
                    }.frame(maxWidth:48)
                }.padding(.horizontal, 32)
                 .frame(maxHeight: .infinity)
                 .navigationBarTitle(remoteState.connection.name,
                                     displayMode: .inline)
                 .navigationBarItems(leading: Button(action: {
                                                    withAnimation {
                                                        remoteStateBinding = nil
                                                    }
                                                }) {
                                                    Image(systemName: "chevron.backward")
                                                        .imageScale(.large)
                                                    Text("Disconnect")
                                                },
                                     trailing:Button(action: {
                                                    withAnimation {
                                                        settingsPresented = true
                                                    }
                                                }) {
                                                    Image(systemName: "gearshape")
                                                })
                
            }
        }.sheet(isPresented: $settingsPresented, content: { ConfigTabs(remoteConfig: remoteConfig) })
    }
}

struct RemotePage_Previews: PreviewProvider {
    static var remoteConfig = QuadimodoRemoteConfig()
    @State static var remoteState: QuadimodoRemoteState? = QuadimodoRemoteState(config: remoteConfig, connection: MockQuadimodoConnection())
    static var previews: some View {
        RemotePage(remoteState: remoteState!, remoteConfig: remoteConfig, remoteStateBinding: $remoteState)
    }
}
