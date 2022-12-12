//
//  ResultImcScreen.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 11/12/22.
//

import UIKit

protocol ResultImcScreenProtocol: AnyObject {
    func actionBackButton()
    func actionNewCalculation()
}

class ResultImcScreen: UIView {

    private weak var delegate: ResultImcScreenProtocol?
    
    func delegate(delegate: ResultImcScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.text = "Seu indice é:"
        return label
    }()
    
    lazy var backAppButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Fechar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(self.tappeBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var classificationImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var classificationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Índice"
        return label
    }()

    lazy var newCalculationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Novo Calculo", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(self.tappenewCalculationButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSuperView()
        configBackGroundColor()
        configConstraints()
    }
    
    private func configSuperView() {
        addSubview(percentageLabel)
        addSubview(backAppButton)
        addSubview(classificationImageView)
        addSubview(classificationLabel)
        addSubview(newCalculationButton)
    }
    
    private func configBackGroundColor() {
        backgroundColor = .gray
    }
    
    func viewThinnessResult(valueIMC: String) {
        percentageLabel.text? += " \(valueIMC)%"
        classificationImageView.image = UIImage(named: "magreza")
        classificationLabel.text = "Magreza"
    }
    
    func viewUnderweightResult(valueIMC: String) {
        percentageLabel.text? += " \(valueIMC)%"
        classificationImageView.image = UIImage(named: "abaixoDoPeso")
        classificationLabel.text = "Abaixo do peso"
    }
    
    func viewIdealResult(valueIMC: String) {
        percentageLabel.text? += " \(valueIMC)%"
        classificationImageView.image = UIImage(named: "pesoIdeal")
        classificationLabel.text = "Peso ideal"
    }
    
    func viewOverweightResult(valueIMC: String) {
        percentageLabel.text? += " \(valueIMC)%"
        classificationImageView.image = UIImage(named: "sobrepeso")
        classificationLabel.text = "Acima do peso"
    }
    
    func viewObesityResult(valueIMC: String) {
        percentageLabel.text? += " \(valueIMC)%"
        classificationImageView.image = UIImage(named: "obesidade")
        classificationLabel.text = "Acima do peso"
    }
    
    @objc private func tappeBackButton() {
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappenewCalculationButton() {
        self.delegate?.actionNewCalculation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            percentageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 90),
            percentageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            percentageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            percentageLabel.heightAnchor.constraint(equalToConstant: 45),
            
            backAppButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            backAppButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            classificationImageView.topAnchor.constraint(equalTo: percentageLabel.bottomAnchor, constant: 40),
            classificationImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            classificationImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            classificationImageView.heightAnchor.constraint(equalToConstant: 300),
            
            classificationLabel.topAnchor.constraint(equalTo: classificationImageView.bottomAnchor, constant: 40),
            classificationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            classificationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            newCalculationButton.topAnchor.constraint(equalTo: classificationLabel.bottomAnchor, constant: 30),
            newCalculationButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            newCalculationButton.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
}
