//
//  SearchLicenseScreen.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 15/12/22.
//

import UIKit

protocol SearchLicenseScreenProtocol: AnyObject {
    func actionShowButton()
    func actionBackButton()
}

class SearchLicenseScreen: UIView {

    private weak var delegate: SearchLicenseScreenProtocol?
    
    func delegate(delegate: SearchLicenseScreenProtocol?) {
        self.delegate = delegate
    }

    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Informe sua placa e descubra quando pode sair com seu veículo"
        return label
    }()
    
    lazy var explanationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.backgroundColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Não passe caracteres especiais"
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
    
    lazy var searchLicenseTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.placeholder = "ex: PKL2245"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var showButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pesquisar", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.tappedShowButton), for: .touchUpInside)
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
        addSubview(explanationLabel)
        addSubview(backAppButton)
        addSubview(searchLicenseTextField)
        addSubview(showButton)
    }
    
    private func configBackGroundColor() {
        backgroundColor = .gray
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        searchLicenseTextField.delegate = delegate
    }
    
    public func passTextField() -> String {
        guard let textField = searchLicenseTextField.text else { return "" }
        
        return textField
    }
    
    @objc private func tappeBackButton() {
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedShowButton() {
        self.delegate?.actionShowButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            backAppButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            backAppButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),

            explanationLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 5),
            explanationLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            explanationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            searchLicenseTextField.topAnchor.constraint(equalTo: explanationLabel.bottomAnchor, constant: 80),
            searchLicenseTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            searchLicenseTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            searchLicenseTextField.heightAnchor.constraint(equalToConstant: 45),
            
            showButton.topAnchor.constraint(equalTo: searchLicenseTextField.bottomAnchor, constant: 100),
            showButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            showButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }

}
