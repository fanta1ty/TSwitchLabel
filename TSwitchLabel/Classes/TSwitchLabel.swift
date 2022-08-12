//
//  TSwitchLabel.swift
//  TSwitchLabel
//
//  Created by Nguyen, Thinh on 12/08/2022.
//

import Foundation
import UIKit

open class TSwitchLabel: UIView {
    private enum Const {
        static let defaultHeight: CGFloat = 24
    }
    
    // MARK: - Private Properties
    private let stackView = UIStackView()
    
    // MARK: - Private Public Properties
    public let titleLabel = UILabel()
    public let switchButton = UISwitch()
    
    public init() {
        super.init(frame: .zero)
        addSubviews()
        setupSubviews()
        setupLayout()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
}

// MARK: - Private Functions
extension TSwitchLabel {
    private func addSubviews() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(switchButton)
        
        addSubview(stackView)
    }
    
    private func setupSubviews() {
        /// stackView
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .equalCentering
        
        /// titleLabel
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = UIColor(rgb: 0x333333)
        titleLabel.accessibilityIdentifier = "label.title"
        
        /// switchButton
        switchButton.accessibilityIdentifier = "switch.button"
    }
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Const.defaultHeight)
        ])
    }
}

private extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
           assert(red >= 0 && red <= 255, "Invalid red component")
           assert(green >= 0 && green <= 255, "Invalid green component")
           assert(blue >= 0 && blue <= 255, "Invalid blue component")

           self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
       }

       convenience init(rgb: Int) {
           self.init(
               red: (rgb >> 16) & 0xFF,
               green: (rgb >> 8) & 0xFF,
               blue: rgb & 0xFF
           )
       }
}
