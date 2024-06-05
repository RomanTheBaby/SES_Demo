//
//  WeatherDisplayView.swift
//  ShopyFlopy
//
//  Created by Roman on 2024-06-05.
//

import UIKit

class WeatherInfoView: UIView {
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    private lazy var contentStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
    
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
        titleLabel.text = weatherInfo.cityName
        subtitleLabel.text = weatherInfo.temperature
    }
    
    // TODO: Task change color
    // TODO: Task change text alignment for both, same code??
    // TODO: Task change font
    
    // MARK: - Private Methods
    
    private func setupInterface() {
        setup(contentStackView: contentStackView)
        setupTitleLabel(titleLabel)
        setupSubtitleLabel(subtitleLabel)
    }
    
    private func setup(contentStackView stackView: UIStackView) {
        // TODO: Task with spacing
        // TODO: Stacke stack to vertical
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setupTitleLabel(_ label: UILabel) {
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
    }
    
    private func setupSubtitleLabel(_ label: UILabel) {
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .center
    }
    
}
