//
//  Adapter.swift
//  StructuralPatterns
//
//  Created by Vadim Mocan on 2/21/19.
//  Copyright © 2019 MidnightWorks. All rights reserved.
//

import Foundation
import Reachability


protocol Ethernet {
    func request()
}

class Adaptee {
    static func someRequest() {
        let reachability = Reachability()!
        
        if reachability.connection == .none {
            print("No connection. Can't start request")
        } else {
            reachability.connection == .wifi ? print("Start request from Wifi") : print("Start request from cellular")
        }
    }
}

