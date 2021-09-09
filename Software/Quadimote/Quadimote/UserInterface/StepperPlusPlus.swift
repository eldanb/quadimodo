//
//  StepperPlusPlus.swift
//  Quadimote
//
//  Created by Eldan Ben Haim on 04/09/2021.
//

import SwiftUI

struct StepperPlusPlus: View {
    @Binding var value: Int32
    var `in`: ClosedRange<Int32>
    @State var step: Int32.Stride

    @State var editingMode: Bool = false
    @State var textValue: String = ""
    @State var textStepValue: String = ""
    
    var body: some View {
        if(editingMode) {
            HStack {
                TextField("Value", text: $textValue)
                Text("S:")
                TextField("Step", text: $textStepValue)
                Button(action: {
                    var allow = true
                    
                    if let convertedStep = Int(textStepValue) {
                        step = convertedStep
                    } else {
                        textStepValue = "\(step)"
                        allow = false;
                    }
                    
                    if let convertedVal = Int32(textValue) {
                        value = convertedVal
                    } else {
                        textValue = "\(value)"
                        allow = false;
                    }
                    
                    if(allow) {
                        editingMode = false;
                    }
                }, label: {
                    Text("Save").padding(.horizontal, 8)
                })
                .frame(minHeight: 32)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(5)
                .foregroundColor(Color.black)
            }
        } else {
            Stepper(value: $value,
                    in: `in`,
                    step: step) {
                Text("\(value)").onTapGesture {
                    textValue = "\(value)"
                    textStepValue = "\(step)"
                    editingMode = true;
                }
            }.frame(minHeight: 32)
        }
    }
}


struct StepperPlusPlus_Preview: View {
    @State var v: Int32 = 0

    var body: some View {
        StepperPlusPlus(value: $v, in: 0...100000, step: 500)
    }
}

struct StepperPlusPlus_Previews: PreviewProvider {
    static var previews: some View {
        StepperPlusPlus_Preview()
    }
}
