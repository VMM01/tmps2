
import Foundation
import Reachability

@objc class Observable: NSObject {
    static var reachability: Reachability? = Reachability()!
    
    func start() {
        do {
            try Observable.reachability!.startNotifier()
        } catch {
            print("This is not working.")
            return
        }
    }
    
}

extension ViewController {
    @objc func reachabilityChanged(_ note: NSNotification) {
        reachability = note.object as! Reachability
        if reachability.connection != .none {
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
        } else {
            print("Not reachable")
        }
        guard let macbookPro = macBookPro, let macbookRegular = macBookRegular else {return}
        macbookPro.request()
        macbookRegular.request()
    }
}


