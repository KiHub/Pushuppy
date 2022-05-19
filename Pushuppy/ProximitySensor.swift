//
//  ProximitySensor.swift
//  Pushuppy
//
//  Created by  Mr.Ki on 19.05.2022.
//

import UIKit


class ProximitySensor {
    
  //  let counterVC = CounterViewController()
    
    func activateProximitySensor() {
        let device = UIDevice.current
        device.isProximityMonitoringEnabled = true
        if device.isProximityMonitoringEnabled {
            NotificationCenter.default.addObserver(self, selector: #selector(proximityChanged(notification:)), name: UIDevice.proximityStateDidChangeNotification, object: device)
        }
    }
    
    @objc func proximityChanged(notification: NSNotification) {
        if let device = notification.object as? UIDevice {
            if device.proximityState {
         //       counterVC.updateWithSetsTwo()
               
            }
        }
    }
    
}
