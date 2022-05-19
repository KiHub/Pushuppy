//
//  CounterViewController.swift
//  Pushuppy
//
//  Created by  Mr.Ki on 19.05.2022.
//

import UIKit

class SetCounterViewController: UIViewController {
    
//    private let gradient: CAGradientLayer = {
//        let gradient = CAGradientLayer()
//        gradient.colors = [appBackGroundColor.cgColor, appMainColor.cgColor]
//        gradient.locations = [0.0 , 1.0]
//        gradient.startPoint = CGPoint(x : 0.0, y : 0)
//        gradient.endPoint = CGPoint(x :0.0, y: 0.5)
//        return gradient
//        
//    }()
    
    let gradient: CAGradientLayer = CAGradientLayer()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 55
        return stackView
    }()
    
    private let startButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = appBackGroundColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get started 🎯", for: .normal)
        button.setTitleColor(appBackGroundColor, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
        return button
    }()
    
    let picker: UIPickerView = UIPickerView()
    var selected = 25
    var selectedSet = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        picker.delegate = self as UIPickerViewDelegate
//        picker.dataSource = self as UIPickerViewDataSource
        self.picker.delegate = self
        self.picker.dataSource = self
        setup()
        style()
        layout()
        
    }
   
    
    func style() {
     //   view.layer.addSublayer(gradient)
        gradient.colors = [appBackGroundColor.cgColor, appMainColor.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x : 0.0, y : 0)
        gradient.endPoint = CGPoint(x :0.0, y: 0.5)
    //    gradient.frame = view.bounds
        
    }
    
    func layout() {
        view.layer.addSublayer(gradient)
        stackView.addArrangedSubview(picker)
        stackView.addArrangedSubview(startButton)
        view.addSubview(stackView)
        
        picker.translatesAutoresizingMaskIntoConstraints = false

        
        let stacViewConstraints = [
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 8),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 8)
        ]
        NSLayoutConstraint.activate(stacViewConstraints)
        
        
    }
    
    func setup() {
        title = "Counter"
        
     //   self.view.addSubview(startButton)
      //  self.view.addSubview(picker)
      //  picker.center = self.view.center
        picker.selectRow(24, inComponent: 0, animated: true)
        picker.selectRow(2, inComponent: 1, animated: true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient.frame = view.bounds
    }
    
}

extension SetCounterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
        case 0:
            return 360
        case 1:
            return 20
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch component {
        case 0:
            return "\(row)"
        case 1:
            return "\(row)"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
        case 0:
            selected = row + 1
            print("selected: \(selected)")
        case 1:
            selectedSet = row + 1
            print("selectedSet: \(selectedSet)")
        default:
            break
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let  view = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 100))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        switch component {
        case 0:
            label.textColor = appBackGroundColor
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.medium)
            view.addSubview(label)
            label.text = String(row + 1)
            return view
        case 1:
            label.textColor = appBackGroundColor
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.medium)
            view.addSubview(label)
            label.text = "x\(row + 1)"
            return view
        default:
            return view
        }
        
    }
    
}

extension SetCounterViewController {
    @objc func startTapped(_ sender: UIButton) {
        let counterVC = CounterViewController()
        navigationController?.pushViewController(counterVC, animated: true)
        counterVC.labelNumber = selected
        counterVC.sets = selectedSet
      //  navigationController?.present(counterVC, animated: true, completion: nil)
        print("Start tapped")
       // counterVC.modalPresentationStyle = .fullScreen
       
  //      navigationController?.modalPresentationStyle = .fullScreen
   //     present(counterVC, animated: true, completion: nil)
        

    }
}
