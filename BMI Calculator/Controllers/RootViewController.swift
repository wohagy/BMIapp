//
//  ViewController.swift
//  BMI Calculator
//
//  Created by wohagy on 24/01/2022.
//  Copyright © 2022 wohagy. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    private lazy var heightSlider = createCustomSlider(minimumValue: 0.1, maximumValue: 2.2)
    private lazy var weightSlider = createCustomSlider(minimumValue: 1, maximumValue: 200)
    private let heightLabel = createCustomLabel(text: "Height")
    private let weightLabel = createCustomLabel(text: "Weight")
    private let weightValueLabel = createCustomLabel(text: "1")
    private let heightValueLabel = createCustomLabel(text: "0.1")
    
    private var BMI: Float = 0
        
    private lazy var heightLabelStack = createStackForLabels(label1: heightLabel, label2: heightValueLabel)
    private lazy var weightLabelStack = createStackForLabels(label1: weightLabel, label2: weightValueLabel)
    
    private let calcButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5223690867, green: 0.5002815723, blue: 0.8675684333, alpha: 1)
        button.titleLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 51).isActive = true
        button.addTarget(self, action: #selector(calcBMI), for: .touchUpInside)
        return button
    }()
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "CALCULATE YOUR BMI"
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private let backImage: UIImageView = {
        let image = UIImage(named: "calculate_background")
        let backimage = UIImageView(image: image!)
        backimage.translatesAutoresizingMaskIntoConstraints = false
        return backimage
    }()
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            appNameLabel, heightLabelStack, heightSlider, weightLabelStack, weightSlider, calcButton
        ])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    static func createCustomLabel(text: String) -> UILabel{
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.textColor = .darkGray
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 21).isActive = true
        return label
    }
    
    private func createCustomSlider(minimumValue: Float, maximumValue: Float) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = maximumValue
        slider.minimumValue = minimumValue
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.heightAnchor.constraint(equalToConstant: 60).isActive = true
        slider.addTarget(self, action: #selector(redrawLabel(_:)), for: .valueChanged)
        return slider
    }
    
    @objc private func redrawLabel(_ sender: UISlider) {
        if sender.maximumValue == 2.2 {
            heightValueLabel.text = String(format:" %.2f", arguments: [sender.value])
        } else {
            weightValueLabel.text = String(format:" %.2f", arguments: [sender.value])
        }
    }
    
    @objc private func calcBMI() {
        let height = heightSlider.value
        let weight = weightSlider.value
        let unRoundBMI = weight / (height * height)
        BMI = round(unRoundBMI * 100) / 100.0
        
        let secondVC = CalcViewController()
        secondVC.BMI = BMI
        present(secondVC, animated: true, completion: nil)
        
    }
    
     private func createStackForLabels(label1: UIView, label2: UIView) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [
                                    label1, label2
        ])
        stack.spacing = 1
        stack.distribution = .equalSpacing
        stack.spacing = 0
        stack.axis = .horizontal
        return stack
    }
    
    
    private func setupView() {
        view.addSubview(backImage)
        view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            // constraiting background image
            backImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -1),
            backImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 1),
            backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -1),
            backImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 1),
            
            //constraiting stack view
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
        ])
    }

}


