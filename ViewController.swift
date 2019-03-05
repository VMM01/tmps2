//
//  ViewController.swift
//  StructuralPatternns
//
//  Created by Vadim Mocan on 2/22/19.
//  Copyright © 2019 MidnightWorks. All rights reserved.
//

import UIKit
import Reachability

class ViewController: UIViewController {
    var reachability: Reachability = Reachability()!
    var observer = Observable() 
    var macBookRegular: MacBookRegular!
    var macBookPro: MacBookPro!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.reachabilityChanged(_:)), name: Notification.Name.reachabilityChanged, object: Observable.reachability)
        observer.start()
        
        let vegaApi: VegaPro = VegaPro()
        let radeonApi: Radeon560X = Radeon560X()
        
        var macbook1: MacBook = MacBookRegular(vegaApi)
        macBookRegular = macbook1 as? MacBookRegular
        //DECORATOR
        print("Cost : $\(macbook1.cost), Description: \(macbook1.description)")
        macbook1 = ProcessorUpgrade(macbook: macbook1)
        print("Cost : $\(macbook1.cost), Description: \(macbook1.description)")
        macbook1 = SSDUpgrade(macbook: macbook1)
        print("Cost : $\(macbook1.cost), Description: \(macbook1.description)")
        macbook1 = TouchBarUpgrade(macbook: macbook1)
        print("Cost : $\(macbook1.cost), Description: \(macbook1.description)\n")
        //BRIDGE
        macBookRegular.graphicsApi?.drawCircle(50, 50, 10)
        //ADAPTER
        macBookRegular.request()
        
        print("\n")
        
        var macbook2: MacBook = MacBookPro(radeonApi)
        macBookPro = macbook2 as? MacBookPro
        //DECORATOR
        print("Cost : $\(macbook2.cost), Description: \(macbook2.description)")
        macbook2 = ProcessorUpgrade(macbook: macbook2)
        print("Cost : $\(macbook2.cost), Description: \(macbook2.description)")
        macbook2 = SSDUpgrade(macbook: macbook2)
        print("Cost : $\(macbook2.cost), Description: \(macbook2.description)")
        macbook2 = TouchBarUpgrade(macbook: macbook2)
        print("Cost : $\(macbook2.cost), Description: \(macbook2.description)\n")
        //BRIDGE
        macBookPro.graphicsApi!.drawRectangle(0, 0, 200, 200)
        //Adapter
        macBookPro.request()
        //Proxy
        let macbook13 = MacBook13Inch(macbook: macBookPro)
        macbook13.buildMac()
    }
}



