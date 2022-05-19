//
//  CounterViewController.swift
//  Pushuppy
//
//  Created by  Mr.Ki on 19.05.2022.
//

import UIKit
import KDCircularProgress

class CounterViewController: UIViewController {

 //   private let gradient = Gradient.shared.gradient
    
    var currentSet = 0
    var timeRemaining = 30
    var setThree = 30
    
    
    let progress = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    var labelNumber = 55
    var sets = 3
    var currentNumber = 0
    let label = UILabel()
    let proximityVC = ProximitySensor()
    
    let gradient: CAGradientLayer = CAGradientLayer()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Thumb")
        
        imageView.layer.shadowColor =  appSecondColor.cgColor
        imageView.layer.shadowOpacity = 0.4
        imageView.layer.shadowOffset = .init(width: 6, height: 3)
        imageView.layer.shadowRadius = 15
        return imageView
    }()
    
    private let cupImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Cup")
        
        imageView.layer.shadowColor =  appSecondColor.cgColor
        imageView.layer.shadowOpacity = 0.4
        imageView.layer.shadowOffset = .init(width: 6, height: 3)
        imageView.layer.shadowRadius = 15
        return imageView
    }()
    
//    private let progressView: KDCircularProgress = {
//
//        let progress = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
////        progress.startAngle = -90
////        progress.progressThickness = 0.2
////        progress.trackThickness = 0.6
////        progress.clockwise = true
////        progress.gradientRotateSpeed = 2
////        progress.roundedCorners = true
////        progress.glowMode = .forward
////        progress.glowAmount = 0.9
////        progress.set(colors: UIColor.cyan ,UIColor.white, UIColor.magenta, UIColor.white, UIColor.orange)
//       // progress.center = CGPoint(x: view.center.x, y: view.center.y + 25)
//      //  view.addSubview(progress)
//
////        let rect = CGRect(x: 10, y: 70, width: 250, height: 250)
////        let progressView = KDCircularProgress(frame: rect)
////                progressView.startAngle = 270
////                progressView.angle = 267
////                progressView.trackColor = UIColor.red
////                progressView.progressColors = [appBackGroundColor, appSecondColor]
////        progressView.roundedCorners = true
////        progressView.contentMode = .scaleToFill
//
//        return progress
//    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 55
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        style()
        layout()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient.frame = view.bounds
        progress.center = view.center
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIDevice.current.isProximityMonitoringEnabled = false
    }

    func style() {
     //   view.layer.addSublayer(gradient)
        gradient.colors = [appBackGroundColor.cgColor, appMainColor.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x : 0.0, y : 0)
        gradient.endPoint = CGPoint(x :0.0, y: 0.5)
        
        
    }
    func setup() {
        currentSet = 0
        currentNumber = 0
        UIDevice.current.isProximityMonitoringEnabled = true
        UIApplication.shared.isIdleTimerDisabled = true
        image.isHidden = true
        cupImage.isHidden = true
        proximityVC.activateProximitySensor()
        
        
        
        progress.trackColor = appBackGroundColor
        progress.startAngle = 270
        progress.angle = 0
        progress.progressThickness = 0.3
        progress.trackThickness = 0.5
        progress.clockwise = true
        progress.gradientRotateSpeed = 2
        progress.glowMode = .reverse
        progress.glowAmount = 0.9
        progress.roundedCorners = true
        progress.set(colors: appThirdColor ,UIColor.white, appFifthColor, appSixthColor)
        progress.center = CGPoint(x: view.center.x, y: view.center.y + 25)
        
//        progress.startAngle = 270
//        progress.angle = 50
      
       // label.text = "55"
        label.text = String(currentNumber)
        label.font = .boldSystemFont(ofSize: 77)
        label.textColor = appBackGroundColor
    }
    func layout() {
        view.layer.addSublayer(gradient)
        view.addSubview(image)
        view.addSubview(cupImage)
     //   progressView.center = view.center
        progress.center = view.center
      //  stackView.addArrangedSubview(progressView)
      //  view.addSubview(stackView)
    view.addSubview(progress)
        view.addSubview(label)
        view.addSubview(progress)
       
        
        
    //    progressView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        
        let imageViewConstraints = [
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ]
        NSLayoutConstraint.activate(imageViewConstraints)
        
        let labelConstraints = [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ]
        NSLayoutConstraint.activate(labelConstraints)
        
        let cupImageViewConstraints = [
            cupImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cupImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ]
        NSLayoutConstraint.activate(cupImageViewConstraints)
        
    }
   
}

extension CounterViewController {
    
    func updateWithSetsTwo() {
        progress.alpha = 1.0
        label.text = "0"
        print("Part3")
        if currentNumber < labelNumber - 1 && currentSet != sets {
            print(currentNumber, ">>>", labelNumber)
            progress.angle += Double(360 / labelNumber)
            currentNumber += 1
            label.text = String(currentNumber)
            print("Part1")
        } else {
            progress.angle = 360
            label.text = ""
            currentSet += 1
           thumbUp()
       //     doneSound.play()
            currentNumber = 0
            label.text = "0"
            if currentSet == sets {
                label.text = ""
                image.isHidden = true
                cupImage.isHidden = false
                UIDevice.current.isProximityMonitoringEnabled = false
                print("Part4")
            }
        }
    }
//    
    func thumbUp() {
        
        
        
        //MARK: - Check here!
        
        image.isHidden = false
        image.alpha = 1.0
        progress.alpha = 1.0
        label.text = ""
        if currentSet != sets {
            UIView.animate(withDuration: 1.0, delay: 1.0, options: [], animations: {
                self.image.alpha = 0.0
                self.progress.alpha = 0.0
            }) { (finished: Bool) in
                self.image.isHidden = true
            }
        } else {
            image.isHidden = true
            cupImage.isHidden = false
        }
    }
//    
}
