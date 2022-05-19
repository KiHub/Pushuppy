//
//  Gradient.swift
//  Pushuppy
//
//  Created by  Mr.Ki on 19.05.2022.
//

import UIKit

class Gradient {

 static let shared = Gradient()
    
 let gradient: CAGradientLayer = {
    let gradient = CAGradientLayer()
    gradient.colors = [appBackGroundColor.cgColor, appMainColor.cgColor]
    gradient.locations = [0.0 , 1.0]
    gradient.startPoint = CGPoint(x : 0.0, y : 0)
    gradient.endPoint = CGPoint(x :0.0, y: 0.5)
    return gradient
    
}()
}
