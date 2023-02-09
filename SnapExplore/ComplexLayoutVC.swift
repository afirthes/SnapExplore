//
//  ComplexLayoutVC.swift
//  SnapExplore
//
//  Created by Afir Thes on 08.02.2023.
//

import UIKit


class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 4,
        left: 10,
        bottom: 4,
        right: 10
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}

class ComplexLayoutVC: UIViewController {
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "kitty")!)
        imageView.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)
        imageView.setContentHuggingPriority(UILayoutPriority(250), for: .vertical)
        imageView.setContentCompressionResistancePriority(UILayoutPriority(48), for: .horizontal)
        imageView.setContentCompressionResistancePriority(UILayoutPriority(48), for: .vertical)
        
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя:"
        label.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        return label
    }()
    
    let middleNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Отчество:"
        label.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        return label
    }()
    
    let lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Фамилия:"
        label.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.setContentHuggingPriority(UILayoutPriority(48), for: .horizontal)
        textField.setContentHuggingPriority(UILayoutPriority(250), for: .vertical)
        textField.setContentCompressionResistancePriority(UILayoutPriority(749), for: .horizontal)
        textField.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let middleNameTextField: UITextField = {
        let textField = UITextField()
        textField.setContentHuggingPriority(UILayoutPriority(48), for: .horizontal)
        textField.setContentHuggingPriority(UILayoutPriority(250), for: .vertical)
        textField.setContentCompressionResistancePriority(UILayoutPriority(749), for: .horizontal)
        textField.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.setContentHuggingPriority(UILayoutPriority(48), for: .horizontal)
        textField.setContentHuggingPriority(UILayoutPriority(250), for: .vertical)
        textField.setContentCompressionResistancePriority(UILayoutPriority(749), for: .horizontal)
        textField.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let namesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 8
        return stack
    }()
    
    let firstNameStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .firstBaseline
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    let middleNameStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .firstBaseline
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    let lastNameStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .firstBaseline
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    let upperStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "F4EFE6")
        
        view.addSubview(upperStack)
        upperStack.snp.makeConstraints { make in
            make.left.top.right.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        upperStack.addArrangedSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.height.equalTo(imageView.snp.width)
        }
        
        upperStack.addArrangedSubview(namesStack)
        
        namesStack.addArrangedSubview(firstNameStack)
        namesStack.addArrangedSubview(middleNameStack)
        namesStack.addArrangedSubview(lastNameStack)
        
        firstNameStack.addArrangedSubview(nameLabel)
        firstNameStack.addArrangedSubview(nameTextField)
        
        middleNameStack.addArrangedSubview(middleNameLabel)
        middleNameStack.addArrangedSubview(middleNameTextField)
        
        lastNameStack.addArrangedSubview(lastNameLabel)
        lastNameStack.addArrangedSubview(lastNameTextField)
        
        nameTextField.snp.makeConstraints { make in
            make.height.equalTo(31)
        }
        
        middleNameTextField.snp.makeConstraints { make in
            make.width.equalTo(nameTextField.snp.width)
            make.height.equalTo(31)
        }
        
        lastNameTextField.snp.makeConstraints { make in
            make.width.equalTo(nameTextField.snp.width)
            make.height.equalTo(31)
        }
        
    }
    
    
}
