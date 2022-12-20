//
//  CalculateImcScreen.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 11/12/22.
//

import UIKit

protocol CalculateImcScreenProtocol: AnyObject {
    func actionCalculateButton()
    func actionBackButton()
}

class CalculateImcScreen: UIView {
    
    private weak var delegate: CalculateImcScreenProtocol?
    
    func delegate(delegate: CalculateImcScreenProtocol?) {
        self.delegate = delegate
    }

    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.text = "Calculo do IMC"
        return label
    }()
    
    lazy var backAppButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Voltar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(self.tappeBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var explanationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Descubra seu índice de massa corporal"
        return label
    }()
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Peso(Kg)"
        return label
    }()
    
    lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Altura(m)"
        return label
    }()
    
    lazy var weightTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.placeholder = "ex: 98.5"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var heightTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.placeholder = "ex: 1.82"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.backgroundColor = .gray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.lightGray, for: .normal)
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSuperView()
        configBackGroundColor()
        configConstraints()
    }
    
    private func configSuperView() {
        addSubview(welcomeLabel)
        addSubview(backAppButton)
        addSubview(explanationLabel)
        addSubview(weightLabel)
        addSubview(heightLabel)
        addSubview(weightTextField)
        addSubview(heightTextField)
        addSubview(calculateButton)
    }
    
    private func configBackGroundColor() {
        backgroundColor = .black
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        weightTextField.delegate = delegate
        heightTextField.delegate = delegate
    }
    
    public func validaTextFields() {
        let weight: Double = Double(weightTextField.text ?? "0.0") ?? 0.0
        let height: Double = Double(heightTextField.text ?? "0.0") ?? 0.0
        
        if weight != 0 && height != 0 {
            configButtonEnabel(true)
        } else {
            configButtonEnabel(false)
        }
    }
    
    public func passWeight() -> String {
        guard let weight = weightTextField.text else { return "" }
        return weight
    }
    
    public func passHeight() -> String {
        guard let height = heightTextField.text else { return ""}
        return height
    }
    
    private func configButtonEnabel(_ enabel: Bool) {
        if enabel {
            calculateButton.setTitleColor(.white, for: .normal)
            calculateButton.isEnabled = true
        } else {
            calculateButton.setTitleColor(.lightGray, for: .normal)
            calculateButton.isEnabled = false
        }
    }
    
    @objc private func tappeBackButton() {
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedCalculateButton() {
        self.delegate?.actionCalculateButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 45),
            
            backAppButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            backAppButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),

            explanationLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 5),
            explanationLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            explanationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            weightLabel.topAnchor.constraint(equalTo: explanationLabel.bottomAnchor, constant: 50),
            weightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            weightLabel.widthAnchor.constraint(equalToConstant: 100),
            weightLabel.heightAnchor.constraint(equalToConstant: 45),
            
            weightTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 10),
            weightTextField.leadingAnchor.constraint(equalTo: weightLabel.leadingAnchor),
            weightTextField.widthAnchor.constraint(equalTo: weightLabel.widthAnchor),
            weightTextField.heightAnchor.constraint(equalTo: weightLabel.heightAnchor),
            
            heightLabel.topAnchor.constraint(equalTo: weightLabel.topAnchor),
            heightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            heightLabel.widthAnchor.constraint(equalToConstant: 100),
            heightLabel.heightAnchor.constraint(equalToConstant: 45),
            
            heightTextField.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 10),
            heightTextField.leadingAnchor.constraint(equalTo: heightLabel.leadingAnchor),
            heightTextField.widthAnchor.constraint(equalTo: heightLabel.widthAnchor),
            heightTextField.heightAnchor.constraint(equalTo: heightLabel.heightAnchor),
            
            calculateButton.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 100),
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
}
