//
//  QuadimodoRemoteConfig.swift
//  Quadimote
//
//  Created by Eldan Ben Haim on 29/05/2021.
//

import Foundation
import SwiftUI

protocol EncodableStruct {
    func encode(with coder: NSCoder)
    init(decodingFrom coder: NSCoder)
}

class EncodableStructWrapper<T: EncodableStruct>: NSObject, NSSecureCoding {
    static var supportsSecureCoding: Bool { return true }
    
    func encode(with coder: NSCoder) {
        value.encode(with: coder)
    }
    
    convenience required init?(coder: NSCoder) {
        self.init(v: T(decodingFrom: coder))
    }
    
    public var value: T
    
    init(v: T) {
        value = v
    }
}

public struct PidConfig : EncodableStruct {
    let factorP: Int32
    let factorI: Int32
    let factorD: Int32
    let setPoint: Int32
    
    var data: Data {
        get {
            var d = Data()
            d.append(primitive: factorP)
            d.append(primitive: factorI)
            d.append(primitive: factorD)
            d.append(primitive: setPoint)
            return d
        }
    }
    
    func with(factorP: Int32) -> PidConfig {
        PidConfig(factorP: factorP,
                  factorI: factorI,
                  factorD: factorD,
                  setPoint: setPoint)
    }

    func with(factorI: Int32) -> PidConfig {
        PidConfig(factorP: factorP,
                  factorI: factorI,
                  factorD: factorD,
                  setPoint: setPoint)
    }
    
    func with(factorD: Int32) -> PidConfig {
        PidConfig(factorP: factorP,
                  factorI: factorI,
                  factorD: factorD,
                  setPoint: setPoint)
    }
    
    func with(setPoint: Int32) -> PidConfig {
        PidConfig(factorP: factorP,
                  factorI: factorI,
                  factorD: factorD,
                  setPoint: setPoint)
    }
    
    
    func withSetpointScaledBy(scale: Double) -> PidConfig {
        PidConfig(factorP: factorP,
                  factorI: factorI,
                  factorD: factorD,
                  setPoint: Int32(Double(setPoint) * scale))
    }
    
    func encode(with coder: NSCoder) {
        coder.encodeCInt(self.factorP, forKey: "factorP")
        coder.encodeCInt(self.factorI, forKey: "factorI")
        coder.encodeCInt(self.factorD, forKey: "factorD")
        coder.encodeCInt(self.setPoint, forKey: "setPoint")
    }
    
    init(decodingFrom coder: NSCoder) {
        self.init(
            factorP: coder.decodeInt32(forKey: "factorP"),
            factorI: coder.decodeInt32(forKey: "factorI"),
            factorD: coder.decodeInt32(forKey: "factorD"),
            setPoint: coder.decodeInt32(forKey: "setPoint"))
    }
    
    init(factorP: Int32, factorI: Int32, factorD: Int32, setPoint: Int32) {
        self.factorP = factorP
        self.factorI = factorI
        self.factorD = factorD
        self.setPoint = setPoint
    }
}


public class QuadimodoRemoteConfig : NSObject, ObservableObject, NSSecureCoding {
    public static var supportsSecureCoding: Bool { return true }

    public func encode(with coder: NSCoder) {
        coder.encode(EncodableStructWrapper(v: rollPid), forKey: "rollPid")
        coder.encode(EncodableStructWrapper(v: pitchPid), forKey: "pitchPid")
        coder.encode(EncodableStructWrapper(v: yawPid), forKey: "yawPid")
    }
    
    public convenience required init?(coder: NSCoder)  {
        self.init()
        do {
            try rollPid = coder.decodeTopLevelObject(of: EncodableStructWrapper<PidConfig>.self, forKey: "rollPid")!.value
            try pitchPid = coder.decodeTopLevelObject(of: EncodableStructWrapper<PidConfig>.self, forKey: "pitchPid")!.value
            try yawPid = coder.decodeTopLevelObject(of: EncodableStructWrapper<PidConfig>.self, forKey: "yawPid")!.value
        } catch {
            return nil
        }
    }
        
    @Published
    public var rollPid: PidConfig = PidConfig(factorP: 25000, factorI: 9, factorD: 3000000, setPoint: 8000)

    @Published
    public var pitchPid: PidConfig = PidConfig(factorP: 25000, factorI: 8, factorD: 3000000, setPoint: 8000)
    
    @Published
    public var yawPid: PidConfig = PidConfig(factorP: 90, factorI: 1, factorD: 25, setPoint: 2000000)

    override init() {}
}
