//
//  ViewController.swift
//  trafаicLight
//
//  Created by Murmachyov on 16.02.2022.
//

import UIKit

enum CurrentLight {
    case green, yellow, red
}

class ViewController: UIViewController {

    @IBOutlet var greenLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var redLight: UIView!

    @IBOutlet var startButton: UIButton!

    private var currentLight = CurrentLight.green
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.2

    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.layer.cornerRadius = 15

        greenLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        redLight.alpha = lightIsOff

//        print("Размер стороны, доступный в методе viweDidload: \(greenLight.frame.height)")
    }

    override func viewDidLayoutSubviews() {
        greenLight.layer.cornerRadius = greenLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        redLight.layer.cornerRadius = redLight.frame.width / 2

//        print("Размер сторон доступный в методе viweWillLayoutSubviews: \(redLight.frame.height)")
    }

    @IBAction func startButtonPressed() {
        if startButton.currentTitle == "START" {
        } else {
            startButton.setTitle("NEXT", for: .normal)
        }

        switch currentLight {
            case .green:
                redLight.alpha = lightIsOff
                greenLight.alpha = lightIsOn
                currentLight = .yellow
            case .yellow:
                greenLight.alpha = lightIsOff
                yellowLight.alpha = lightIsOn
                currentLight = .red
            case .red:
                yellowLight.alpha = lightIsOff
                redLight.alpha = lightIsOn
                currentLight = .green
        }
    }

}

