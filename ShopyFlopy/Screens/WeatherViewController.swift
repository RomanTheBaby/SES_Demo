//
//  ViewController.swift
//  ShopyFlopy
//
//  Created by Roman on 2024-06-05.
//

import UIKit

// TODO: Task to 

class ShoppingListViewController: UIViewController {
    
    // MARK: - Properties
    
    private let weatherInfoView = WeatherInfoView()
    private let showWeatherButton: UIButton = UIButton()
    private let headlineLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInterface()
    }
    
    // MARK: - UI Setup
    
    private func setupInterface() {
        setupHeadlineLabel(headlineLabel)
        setupWeatherButton(showWeatherButton)
        setupWeatherInfoView(weatherInfoView)
    }
    
    private func setupHeadlineLabel(_ label: UILabel) {
        label.text = "TODAY"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
    }

    private func setupWeatherButton(_ button: UIButton) {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "arrow.counterclockwise")
        configuration.imagePadding = 8
        configuration.imagePlacement = .trailing
        configuration.title = "retry" // Task to change title
        configuration.cornerStyle = .small // Task to change corner radius
        button.configuration = configuration
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.30),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        button.addTarget(self, action: #selector(handleShowWeatherPressEnded(_:)), for: .touchUpInside)
        
        // Task to hide button when it is pressed
    }
    
    private func setupWeatherInfoView(_ view: WeatherInfoView) {
        // TODO: Task to add this line, hidden until weather
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        
        // TODO: Task with shadow and corner radius
//        view.layer.borderWidth = 1 / UIScreen.main.scale
//        view.layer.borderColor = UIColor.black.cgColor
//        view.layer.cornerRadius = 8
//        view.layer.shadowRadius = 5
//        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
//        view.layer.shadowOffset = CGSize(width: 5, height: 5)
//        view.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            view.bottomAnchor.constraint(equalTo: showWeatherButton.topAnchor, constant: -16),
        ])
        
        view.update(for: WeatherInformation(cityName: "City", temperature: "20°", title: "Partly Cloudly", description: "Mostly clouds with the slight breeze of the sun", backgroundImageURL: nil))
    }
    
    // MARK: - Action Handling
    
    @objc private func handleShowWeatherPressEnded(_ sender: UIButton) {
        
    }

}

