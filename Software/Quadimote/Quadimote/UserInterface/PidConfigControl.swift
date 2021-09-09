//
//  PidConfigControl.swift
//  Quadimote
//
//  Created by Eldan Ben Haim on 19/05/2021.
//

import Foundation
import SwiftUI

struct PidConfigControl : View {
    var title: String
    
    var pMax: Int32
    var iMax: Int32
    var dMax: Int32
    var sMax: Int32

    @Binding var value: PidConfig
    
    public var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(.vertical, 24)
            
            HStack(alignment: .center, spacing: 48) {
                VStack {
                    HStack {
                        Text("Speed: ")
                            .frame(width: 64, alignment: .leading)
                        StepperPlusPlus(
                            value: Binding(get: { value.setPoint }, set: { value = value.with(setPoint: $0) }),
                            in: 0...sMax,
                            step: Int(max(sMax/200, 1)))
                            .frame(maxWidth: .infinity)
                    }
                    
                    HStack {
                        Text("P:")
                            .frame(width: 64, alignment: .leading)
                        StepperPlusPlus(
                            value: Binding(get: { value.factorP }, set: { value = value.with(factorP: $0) }),
                            in: 0...pMax,
                            step: Int(max(pMax/200, 1)))
                            .frame(maxWidth: .infinity)
                    }
                }
                
                VStack {
                    HStack {
                        Text("I:")
                            .frame(width: 64, alignment: .leading)
                        StepperPlusPlus(
                            value: Binding(get: { value.factorI }, set: { value = value.with(factorI: $0) }),
                            in: 0...iMax,
                            step: Int(max(iMax/200, 1)))
                            .frame(maxWidth: .infinity)
                    }

                    HStack {
                        Text("D:")
                            .frame(width: 64, alignment: .leading)
                        StepperPlusPlus(
                            value: Binding(get: { value.factorD }, set: { value = value.with(factorD: $0) }),
                            in: 0...dMax,
                            step: Int(max(dMax/200, 1)))
                            .frame(maxWidth: .infinity)
                    }
                }

            }
            Spacer()
        }
    }
}
