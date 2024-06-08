//
//  WeatherDisplayView.swift
//  ShopyFlopy
//
//  Created by Roman on 2024-06-05.
//

import UIKit

class WeatherInfoView: UIView {
    
    private let temperatureLabel = UILabel()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    private lazy var textsStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
    private lazy var contentStackView = UIStackView(arrangedSubviews: [temperatureLabel, textsStackView])
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupInterface()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupInterface()
    }
    
    // MARK: - Public Methods
    
    func update(for weatherInfo: WeatherInformation) {
        temperatureLabel.text = weatherInfo.temperature
        
        titleLabel.text = weatherInfo.title
        subtitleLabel.text = weatherInfo.description
        subtitleLabel.numberOfLines = 0
    }
    
    // TODO: Task change color
    // TODO: Task change text alignment for both, same code??
    // TODO: Task change font
    
    // MARK: - Private Methods
    
    private func setupInterface() {
        setup(contentStackView: contentStackView)
        setupTextsStackView(textsStackView)
        setupTitleLabel(temperatureLabel)
        setupTitleLabel(titleLabel)
        setupSubtitleLabel(subtitleLabel)
    }
    
    private func setup(contentStackView stackView: UIStackView) {
        // TODO: Task with spacing
        // TODO: Stacke stack to vertical
        stackView.axis = .horizontal
        stackView.spacing = 8
//        stackView.distribution = .fillEqually
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
    
    private func setupTextsStackView(_ stackView: UIStackView) {
        // TODO: Task with spacing
        // TODO: Stacke stack to vertical
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
    }
    
    private func setupTemperatureLabel(_ label: UILabel) {
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
    }
    
    private func setupTitleLabel(_ label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.textAlignment = .left
    }
    
    private func setupSubtitleLabel(_ label: UILabel) {
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .left
    }
}
