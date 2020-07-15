//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Jaedoo Ko on 2020/07/15.
//  Copyright © 2020 jko. All rights reserved.
//

import UIKit

//  MARK: - UIViewController

final class ViewController: UIViewController {

    // MARK: - UI Properties
    
    private let label = UILabel()
    private let button = UIButton()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLayout()
        self.bindStyle()
    }

    // MARK: - Functions
    
    private func bindStyle() {
        self.view.backgroundColor = .white
        
        label.textColor = .black
        label.backgroundColor = .yellow
        label.text = "얍?"
        
        button.setTitleColor(.black, for: .normal)
        button.setTitle("얍!", for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
    }
    
    private func setLayout() {
        [label, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -50),
            label.widthAnchor.constraint(equalToConstant: 100),
            
            button.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 20),
            button.widthAnchor.constraint(equalToConstant: 100),
        ])
    }

}

