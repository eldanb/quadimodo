//
//  PressControl.swift
//  Quadimote
//
//  Created by Eldan Ben Haim on 17/05/2021.
//

import Foundation
import SwiftUI

public struct PressControl<V>: View {
    var baseImage: Image
    @Binding var value: V
    var whenOn: V
    var whenOff: V
    
    @State var clicking = false
        
    public var body: some View {
        baseImage
            .renderingMode(.template)
            .foregroundColor(.blue)
            .opacity( clicking ? 0.2 : 1.0)
            .imageScale(.large)
            .highPriorityGesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .global)
                    .onChanged { _ in
                        clicking = true;
                        value = whenOn;
                    }
                    .onEnded { _ in
                        withAnimation(.easeIn(duration: 0.25)) {
                            clicking = false;
                        }
                        value = whenOff;
                    }
            )
    }
}
