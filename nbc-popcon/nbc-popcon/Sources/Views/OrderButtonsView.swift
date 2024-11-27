//
//  ButtonsView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit
import SnapKit

class ButtonsView: UIView {
    let themeManager = ThemeManager()
    
    var onCompleteOrder: (() -> (Void))? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(buttonStackView)
        setStackViewAutoLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("취소하기", for: .normal)
        button.titleLabel?.font = themeManager.fonts.bold
        button.layer.cornerRadius = 25
        button.backgroundColor = themeManager.colors.grey1
        button.frame.size.width = 70

        return button
    }()
    
    lazy var purchaseButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("결제하기", for: .normal)
        button.titleLabel?.font = themeManager.fonts.bold
        button.layer.cornerRadius = 25
        button.backgroundColor = themeManager.colors.blue
        button.frame.size.width = 70

        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [cancelButton, purchaseButton])
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.backgroundColor = themeManager.colors.red
        st.spacing = themeManager.numbers.padding
        return st
    }()
    
    func setStackViewAutoLayOut() {
        buttonStackView.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading).inset(0)
            $0.trailing.equalTo(self.snp.trailing).inset(0)
            $0.bottom.equalTo(self.snp.bottom).inset(60)
            $0.top.equalTo(<#T##other: any ConstraintRelatableTarget##any ConstraintRelatableTarget#>)
            $0.height.equalTo(50)
        }
    }
}

extension ButtonsView {
    
     private func purchaseButtonAction() {
         self.purchaseButton.addTarget(self.purchaseButton, action: #selector(purchaseButtonTapped), for: .touchUpInside)
    }
    
    @objc  func purchaseButtonTapped() {
        guard let purchaseButtonTapped = self.onCompleteOrder else { return }
        purchaseButtonTapped()
    }
    
}
#Preview {
  ViewController()
}
