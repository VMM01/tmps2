//
//  Bridge.swift
//  StructuralPatterns
//
//  Created by Vadim Mocan on 2/20/19.
//  Copyright © 2019 MidnightWorks. All rights reserved.
//

import Foundation

protocol GraphicsAPI {
    func drawRectangle(_ x: Int, _ y: Int, _ width: Int, _ height: Int)
    func drawCircle(_ x: Int, _ y: Int, _ radius: Int)
}

class VegaPro : GraphicsAPI {
    
    func drawRectangle(_ x: Int, _ y: Int, _ width: Int, _ height: Int) {
        print("Rectangle drawn by VegaPro")
    }
    
    func drawCircle(_ x: Int, _ y: Int, _ radius: Int) {
        print("Circle drawn by VegaPro")
    }
}

public class Radeon560X : GraphicsAPI {
    
    func drawRectangle(_ x: Int, _ y: Int, _ width: Int, _ height: Int) {
        print("Rectangle drawn by Radeon560X")
    }
    
    func drawCircle(_ x: Int, _ y: Int, _ radius: Int) {
        print("Circle drawn by Radeon560X")
    }
}
