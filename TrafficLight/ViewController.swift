//
//  ViewController.swift
//  TrafficLight
//
//  Created by Vladislav Kuznetsov on 21.12.24..
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var redLabel: UIView!
    @IBOutlet var yellowLabel: UIView!
    @IBOutlet var greenLabel: UIView!
    
    @IBOutlet var proccessButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn = 1.0
    private let lightIsOff = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLabel.layer.cornerRadius = redLabel.frame.width / 2
        yellowLabel.layer.cornerRadius = yellowLabel.frame.width / 2
        greenLabel.layer.cornerRadius = greenLabel.frame.width / 2
        
        proccessButton.layer.cornerRadius = 10

    }
    
    @IBAction func proccessButtonTapped() {
        if proccessButton.currentTitle == "Start" {
            proccessButton.setTitle("Next", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenLabel.alpha = lightIsOff
            redLabel.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLabel.alpha = lightIsOff
            yellowLabel.alpha = lightIsOn
            currentLight = .green
        case .green:
            yellowLabel.alpha = lightIsOff
            greenLabel.alpha = lightIsOn
            currentLight = .red
            
        }
  
    }
}

// MARK: - CurrentLight
extension ViewController {
    private enum CurrentLight {
        case red, yellow, green
    }
}
