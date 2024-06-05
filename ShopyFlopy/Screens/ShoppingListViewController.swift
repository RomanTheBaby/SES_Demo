//
//  ViewController.swift
//  ShopyFlopy
//
//  Created by Roman on 2024-06-05.
//

import UIKit

class ShoppingListViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var showWeatherButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInterface()
    }
    
    // MARK: - UI Setup
    
    private func setupInterface() {
        setupWeatherButton(showWeatherButton)
    }

    private func setupWeatherButton(_ button: UIButton) {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Show Weather" // Task to change title
        configuration.cornerStyle = .small // Task to change corner radius
        button.configuration = configuration
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        button.addTarget(self, action: #selector(handleShowWeatherPressEnded(_:)), for: .touchUpInside)
    }
    
    // MARK: - Action Handling
    
    @objc private func handleShowWeatherPressEnded(_ sender: UIButton) {
        
    }

}

