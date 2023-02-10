//
//  ResultLicenseScreen.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 18/12/22.
//

import UIKit

protocol ResultLicenseScreenProtocol: AnyObject {
    func actionBackButton()
}

class ResultLicenseScreen: UIView {
    
    private weak var delegate: ResultLicenseScreenProtocol?
    
    func delegate(delegate: ResultLicenseScreenProtocol?) {
        self.delegate = delegate
    }

    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Dias da Semana:"
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
        label.text = "Segunda"
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
    }
    
    private func configBackGroundColor() {
        backgroundColor = .gray
    }
    
    public func configExplanationLabel(result: String) {
        explanationLabel.text = result
    }
    
    @objc private func tappeBackButton() {
        self.delegate?.actionBackButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            explanationLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 5),
            explanationLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            explanationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            backAppButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            backAppButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),

        ])
    }

}
