//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Jaedoo Ko on 2020/07/15.
//  Copyright © 2020 jko. All rights reserved.
//

import UIKit

public enum MyNotification {
    case buttonClicked
    
    var name: Notification.Name {
        switch self {
        case .buttonClicked:
            return Notification.Name("얍!")
        }
    }
}


//  MARK: - UIViewController

final class ViewController: UIViewController {

    // MARK: - UI Properties
    
    private let label = UILabel()
    private let button = UIButton()
    
    // MARK: - Properties
    
    private var count: Int = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLayout()
        self.bindStyle()
        self.bindData()
    }

    // MARK: - Functions
    
    @objc
    private func changeLabelText(_ notification: Notification) {
        label.text = notification.object as? String
        print(notification.name.rawValue)
    }
    
    @objc
    private func buttonClicked(_ sender: UIButton) {
        count += 1
        NotificationCenter.default.post(
            name: MyNotification.buttonClicked.name,
            object: "얍! x \(count)"
        )
    }
    
    private func bindData() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(changeLabelText(_:)),
            name: MyNotification.buttonClicked.name,
            object: nil
        )
        
        label.text = "얍?"
        
        button.setTitle("얍!", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    private func bindStyle() {
        self.view.backgroundColor = .white
        
        label.textColor = .black
        label.backgroundColor = .yellow
        label.textAlignment = .center
        
        button.setTitleColor(.black, for: .normal)
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

