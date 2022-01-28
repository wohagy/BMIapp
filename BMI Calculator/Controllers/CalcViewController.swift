//
//  CalcViewController.swift
//  BMI Calculator
//
//  Created by wohagy on 25.01.2022.
//  Copyright © 2022 wohagy. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    
    var bmiResult: BMI?
    
    private let backImage: UIImageView = {
        let image = UIImage(named: "result_background")
        let backimage = UIImageView(image: image!)
        backimage.translatesAutoresizingMaskIntoConstraints = false
        return backimage
    }()
    
    
    private let firsLabel = UILabel.createCustomLabel(labelText: "YOUR RESULT", color: .white, fontSize: 35, fontWeight: .bold)
    private lazy var resultLabel = UILabel.createCustomLabel(labelText: String(bmiResult!.value), color: bmiResult!.color, fontSize: 80, fontWeight: .bold)
    private lazy var secondLabel = UILabel.createCustomLabel(labelText: bmiResult!.advice, color: .white, fontSize: 20, fontWeight: .light)
    
    
    
    private lazy var labelStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firsLabel,resultLabel,secondLabel])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.distribution = .fill
        return stack
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back to calc", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.5223690867, green: 0.5002815723, blue: 0.8675684333, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 51).isActive = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1185996011, green: 0.5052891374, blue: 0.8364805579, alpha: 1)
        setupView()
    }
    
//    @objc private func closeDisplay() {
//        
//    }
    
    private func setupView() {
        view.addSubview(backImage)
        view.addSubview(labelStack)
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -1),
            backImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 1),
            backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -1),
            backImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 1),
            
            labelStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            backButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            backButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    deinit {
        print("CalcViewController was deinited")
    }
}

extension UILabel {
    static func createCustomLabel(labelText: String, color: UIColor, fontSize: CGFloat, fontWeight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.text = labelText
        label.textColor = color
        label.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
