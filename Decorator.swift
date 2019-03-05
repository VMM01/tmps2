//
//  Decorator.swift
//  StructuralPatterns
//
//  Created by Vadim Mocan on 2/20/19.
//  Copyright © 2019 MidnightWorks. All rights reserved.
//

import Foundation

protocol MacBook {
    var mbInstance : MacBook? { get set }
    var cost : Double { get }
    var description : String { get }
    func buildMac()
}

class MacBookAir : Adaptee, Ethernet, MacBook  {
    func buildMac() {
        print("MacBook Air")
    }
    
    var mbInstance: MacBook?
    
    var graphicsApi: GraphicsAPI?
    
    override init() {
        
    }
    
    init(_ graphicsApi: GraphicsAPI) {
        self.graphicsApi = graphicsApi
    }
    
    var cost: Double {
        get {
            return 999
        }
    }
    
    var description: String {
        get {
            return "MacBook Air"
        }
    }
    
    func request() {
        Adaptee.someRequest()
    }
}

class MacBookPro: Adaptee, Ethernet, MacBook {
    func buildMac() {
        print("MacBook Pro")
    }
    
    var mbInstance: MacBook?
    var graphicsApi: GraphicsAPI?
    
    override init() {
        
    }
    
    init(_ graphicsApi: GraphicsAPI) {
        self.graphicsApi = graphicsApi
    }
    
    var cost: Double {
        get {
            return 1599
        }
    }
    
    var description: String {
        get {
            return "MacBook Pro"
        }
    }
    
    func request() {
        Adaptee.someRequest()
    }
}

class MacBook13Inch: MacBook {
    var mbInstance: MacBook?
    var cost: Double
    var description: String
    
    var macbook: MacBook
    
    init(macbook: MacBook, cost: Double? = nil, description: String? = nil) {
        self.macbook = macbook
        self.cost = cost ?? 600
        self.description = description ?? ""
    }
    
    //Proxy
    func buildMac() {
        macbook.buildMac()
        print("build 13\"")
    }
}

class MacBookRegular : Adaptee, Ethernet, MacBook {
    func buildMac() {
        print("MacBook Regular")
    }
    
    var mbInstance: MacBook?
    var graphicsApi: GraphicsAPI?
    
    override init() {
        
    }
    
    init(_ graphicsApi: GraphicsAPI) {
        self.graphicsApi = graphicsApi
    }
    
    var cost: Double {
        get {
            return 1099
        }
    }
    
    var description: String {
        get {
            return "MacBook"
        }
    }
    
    func request() {
        Adaptee.someRequest()
    }
}

class MacBookDecorator : MacBook {
    func buildMac() {
        
    }
    
    var mbInstance : MacBook?
    var cost: Double {
        get {
            return mbInstance!.cost
        }
    }
    
    var description: String {
        get {
            return mbInstance!.description
        }
    }
    
    required init(macbook: MacBook) {
        self.mbInstance = macbook
    }
    
    func shared() -> MacBook {
        return self
    }
}

class ProcessorUpgrade : MacBookDecorator {
    override var cost: Double {
        get {
            return mbInstance!.cost + 499
        }
    }
    
    override var description: String {
        get {
            return mbInstance!.description + ", i7 Processor"
        }
    }
    
    required init(macbook: MacBook) {
        super.init(macbook: macbook)
    }
}

class SSDUpgrade : MacBookDecorator {
    override var cost: Double {
        get {
            return mbInstance!.cost + 299
        }
    }
    
    override var description: String {
        get {
            return mbInstance!.description + ", 512gb SSD"
        }
    }
    
    required init(macbook: MacBook) {
        super.init(macbook: macbook)
    }
}

class TouchBarUpgrade : MacBookDecorator {
    override var cost: Double {
        get {
            return mbInstance!.cost + 199
        }
    }
    
    override var description: String {
        get {
            return mbInstance!.description + ", TouchBar"
        }
    }
    
    required init(macbook: MacBook) {
        super.init(macbook: macbook)
    }
}
